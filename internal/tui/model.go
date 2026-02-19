package tui

import (
	"fmt"
	"io"
	"os"
	"strings"

	"github.com/charmbracelet/bubbles/key"
	"github.com/charmbracelet/bubbles/spinner"
	"github.com/charmbracelet/bubbles/textinput"
	"github.com/charmbracelet/bubbles/viewport"
	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"

	"github.com/Gogh-Co/Gogh/cli/internal/apply"
	"github.com/Gogh-Co/Gogh/cli/internal/assets"
)

type screenState int

const (
	stateBrowse screenState = iota
	stateInstalling
	stateResult
)

type installDoneMsg struct {
	err error
}

type logMsg string

type installWriter struct{}

func (installWriter) Write(p []byte) (int, error) {
	cp := make([]byte, len(p))
	copy(cp, p)
	if prog != nil {
		prog.Send(logMsg(cp))
	}
	return len(p), nil
}

var prog *tea.Program

type Model struct {
	themes         []assets.Theme
	filtered       []assets.Theme
	selected       int
	scrollOffset   int
	visibleRows    int
	cols           int
	colWidth       int
	width          int
	height         int
	search         textinput.Model
	styles         styleSet
	state          screenState
	sp             spinner.Model
	vp             viewport.Model
	prepared       assets.Prepared
	installLog     strings.Builder
	status         string
	lastErr        error
	targetTerminal string
}

func New(themes []assets.Theme, prepared assets.Prepared, cacheDir string) Model {
	ti := textinput.New()
	ti.Prompt = ""
	ti.Placeholder = "Type to filter themes"
	ti.Focus()
	ti.CharLimit = 200
	ti.Width = 40

	sp := spinner.New(spinner.WithSpinner(spinner.Line))
	sp.Style = lipgloss.NewStyle().Foreground(lipgloss.Color("69"))

	m := Model{
		themes:         themes,
		filtered:       append([]assets.Theme(nil), themes...),
		selected:       0,
		scrollOffset:   0,
		visibleRows:    10,
		cols:           1,
		colWidth:       28,
		search:         ti,
		styles:         newStyles(),
		state:          stateBrowse,
		sp:             sp,
		prepared:       prepared,
		targetTerminal: os.Getenv("TERMINAL"),
	}
	m.vp = viewport.New(80, 20)
	m.ensureSelectedVisible()
	return m
}

func Run(themes []assets.Theme, prepared assets.Prepared, cacheDir string) error {
	m := New(themes, prepared, cacheDir)
	p := tea.NewProgram(m, tea.WithAltScreen(), tea.WithMouseCellMotion())
	prog = p
	defer func() { prog = nil }()
	_, err := p.Run()
	return err
}

func (m Model) Init() tea.Cmd {
	return textinput.Blink
}

func (m Model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch msg := msg.(type) {
	case tea.WindowSizeMsg:
		m.width = msg.Width
		m.height = msg.Height
		m.resizeLayout()
		m.ensureSelectedVisible()
		return m, nil
	case logMsg:
		m.installLog.WriteString(string(msg))
		m.vp.SetContent(m.installLog.String())
		m.vp.GotoBottom()
		return m, nil
	case installDoneMsg:
		if msg.err != nil {
			m.lastErr = msg.err
			m.status = "Install failed"
			m.state = stateResult
			return m, nil
		} else {
			m.lastErr = nil
			if len(m.filtered) > 0 && m.selected < len(m.filtered) {
				m.status = "Installed: " + m.filtered[m.selected].Name
			} else {
				m.status = "Installed"
			}
			// Close TUI immediately after successful install as requested.
			return m, tea.Quit
		}
	case tea.MouseMsg:
		if m.state == stateInstalling {
			var cmd tea.Cmd
			m.vp, cmd = m.vp.Update(msg)
			return m, cmd
		}
		if m.state == stateBrowse {
			if msg.Action == tea.MouseActionPress {
				switch msg.Button {
				case tea.MouseButtonWheelDown:
					m.moveDown()
					return m, nil
				case tea.MouseButtonWheelUp:
					m.moveUp()
					return m, nil
				}
			}
			return m, nil
		}
		return m, nil
	case tea.KeyMsg:
		if key.Matches(msg, keys.Quit) {
			return m, tea.Quit
		}
		if m.state == stateInstalling {
			if msg.String() == "esc" {
				m.state = stateBrowse
				m.ensureSelectedVisible()
				return m, nil
			}
			var cmd tea.Cmd
			m.vp, cmd = m.vp.Update(msg)
			return m, cmd
		}
		if m.state == stateResult {
			if key.Matches(msg, keys.Back, keys.ClearFind) {
				m.state = stateBrowse
				m.status = ""
				m.lastErr = nil
				m.ensureSelectedVisible()
			}
			return m, nil
		}

		if key.Matches(msg, keys.FocusFind) {
			m.search.Focus()
			return m, nil
		}
		if key.Matches(msg, keys.ClearFind) {
			if m.search.Value() != "" {
				m.search.SetValue("")
				m.applyFilter()
				return m, nil
			}
		}
		if key.Matches(msg, keys.Install) {
			if len(m.filtered) == 0 {
				return m, nil
			}
			m.state = stateInstalling
			m.installLog.Reset()
			m.vp.SetContent("")
			m.status = "Installing " + m.filtered[m.selected].Name + " ..."
			return m, tea.Batch(m.sp.Tick, m.installCmd(m.filtered[m.selected]))
		}

		if key.Matches(msg, keys.Left) {
			m.moveLeft()
			return m, nil
		}
		if key.Matches(msg, keys.Right) {
			m.moveRight()
			return m, nil
		}
		if key.Matches(msg, keys.Up) {
			m.moveUp()
			return m, nil
		}
		if key.Matches(msg, keys.Down) {
			m.moveDown()
			return m, nil
		}
		if key.Matches(msg, keys.Home) {
			m.selected = 0
			m.ensureSelectedVisible()
			return m, nil
		}
		if key.Matches(msg, keys.End) {
			if len(m.filtered) > 0 {
				m.selected = len(m.filtered) - 1
			}
			m.ensureSelectedVisible()
			return m, nil
		}
		if key.Matches(msg, keys.PageUp) {
			m.pageMove(-1)
			return m, nil
		}
		if key.Matches(msg, keys.PageDown) {
			m.pageMove(1)
			return m, nil
		}
	}

	if m.state == stateBrowse {
		old := m.search.Value()
		var cmd tea.Cmd
		m.search, cmd = m.search.Update(msg)
		if m.search.Value() != old {
			m.applyFilter()
		}
		return m, cmd
	}

	if m.state == stateInstalling {
		var cmd tea.Cmd
		m.sp, cmd = m.sp.Update(msg)
		return m, cmd
	}

	return m, nil
}

func (m Model) View() string {
	headerTitle := m.styles.Header.Render("Gogh") + " " + m.styles.Subtle.Render(fmt.Sprintf("%d themes", len(m.filtered)))
	if m.targetTerminal != "" {
		headerTitle += " " + m.styles.Subtle.Render("target: "+m.targetTerminal)
	}

	headerWidth := max(24, m.width-8)
	palette := defaultPalette()
	if theme, ok := m.currentSelectedTheme(); ok {
		palette = getPalette(theme, m.prepared)
	}
	paletteBar := renderPaletteBar(palette, max(8, headerWidth-4))

	header := m.styles.HeaderBox.Width(headerWidth).Render(headerTitle + "\n" + paletteBar)

	search := m.styles.SearchLabel.Render("Search: ") + m.search.View()

	switch m.state {
	case stateInstalling:
		title := m.styles.PanelTitle.Render(m.sp.View() + " " + m.status)
		panel := m.styles.Panel.Width(max(24, m.width-8)).Height(max(6, m.height-12)).Render(m.vp.View())
		footer := m.styles.Footer.Render("q quit • esc back • pgup/pgdn scroll")
		return m.styles.Doc.Render(strings.Join([]string{header, search, "", title, panel, footer}, "\n"))
	case stateResult:
		statusStyle := m.styles.Ok
		if m.lastErr != nil {
			statusStyle = m.styles.Err
		}
		msg := statusStyle.Render(m.status)
		if m.lastErr != nil {
			msg += "\n" + m.styles.Subtle.Render(m.lastErr.Error())
		}
		footer := m.styles.Footer.Render("b/esc back • q quit")
		return m.styles.Doc.Render(strings.Join([]string{header, search, "", msg, "", m.vp.View(), footer}, "\n"))
	default:
		panel := m.styles.Panel.Width(max(24, m.width-8)).Height(max(6, m.height-12)).Render(m.renderVisibleList())
		footer := m.styles.Footer.Render("↑↓/hjkl move • enter install • / search • esc clear • pgup/pgdn page • q quit")
		return m.styles.Doc.Render(strings.Join([]string{header, search, "", panel, footer}, "\n"))
	}
}

func (m Model) currentSelectedTheme() (assets.Theme, bool) {
	if len(m.filtered) == 0 {
		return assets.Theme{}, false
	}
	idx := min(max(0, m.selected), len(m.filtered)-1)
	return m.filtered[idx], true
}

func (m *Model) applyFilter() {
	needle := strings.ToLower(strings.TrimSpace(m.search.Value()))
	currentName := ""
	if m.selected >= 0 && m.selected < len(m.filtered) {
		currentName = m.filtered[m.selected].Name
	}
	if needle == "" {
		m.filtered = append([]assets.Theme(nil), m.themes...)
	} else {
		m.filtered = m.filtered[:0]
		for _, t := range m.themes {
			if strings.Contains(strings.ToLower(t.Name), needle) {
				m.filtered = append(m.filtered, t)
			}
		}
	}
	if len(m.filtered) == 0 {
		m.selected = 0
		m.scrollOffset = 0
		return
	}
	if currentName != "" {
		for i := range m.filtered {
			if m.filtered[i].Name == currentName {
				m.selected = i
				m.ensureSelectedVisible()
				return
			}
		}
	}
	m.selected = min(m.selected, len(m.filtered)-1)
	m.selected = max(0, m.selected)
	m.ensureSelectedVisible()
}

func (m *Model) moveLeft() {
	if len(m.filtered) == 0 {
		return
	}
	if m.selected > 0 {
		m.selected--
	}
	m.ensureSelectedVisible()
}

func (m *Model) moveRight() {
	if len(m.filtered) == 0 {
		return
	}
	if m.selected < len(m.filtered)-1 {
		m.selected++
	}
	m.ensureSelectedVisible()
}

func (m *Model) moveUp() {
	if len(m.filtered) == 0 {
		return
	}
	next := m.selected - m.cols
	if next >= 0 {
		m.selected = next
	}
	m.ensureSelectedVisible()
}

func (m *Model) moveDown() {
	if len(m.filtered) == 0 {
		return
	}
	row := m.selected / m.cols
	col := m.selected % m.cols
	nextRow := row + 1
	if nextRow >= m.totalRows() {
		return
	}
	next := nextRow*m.cols + col
	if next >= len(m.filtered) {
		next = len(m.filtered) - 1
	}
	m.selected = next
	m.ensureSelectedVisible()
}

func (m *Model) pageMove(dir int) {
	if len(m.filtered) == 0 {
		return
	}
	delta := max(1, m.visibleRows)
	row := m.selected / m.cols
	col := m.selected % m.cols
	if dir < 0 {
		row = max(0, row-delta)
	} else {
		row = min(m.totalRows()-1, row+delta)
	}
	m.selected = row*m.cols + col
	if m.selected >= len(m.filtered) {
		m.selected = len(m.filtered) - 1
	}
	m.ensureSelectedVisible()
}

func (m *Model) resizeLayout() {
	m.vp.Width = max(20, m.width-14)
	m.vp.Height = max(5, m.height-13)
	m.visibleRows = max(1, m.height-13)
	bodyWidth := max(16, m.width-18)
	minColWidth := 28
	m.cols = max(1, bodyWidth/minColWidth)
	m.colWidth = max(16, bodyWidth/m.cols)
}

func (m Model) maxBrowseOffset() int {
	if len(m.filtered) == 0 {
		return 0
	}
	return max(0, m.totalRows()-m.visibleRows)
}

func (m *Model) ensureSelectedVisible() {
	if len(m.filtered) == 0 {
		m.selected = 0
		m.scrollOffset = 0
		return
	}
	m.selected = max(0, min(m.selected, len(m.filtered)-1))
	selectedRow := m.selected / m.cols
	if selectedRow < m.scrollOffset {
		m.scrollOffset = selectedRow
	} else {
		lastVisible := m.scrollOffset + m.visibleRows - 1
		if selectedRow > lastVisible {
			m.scrollOffset = selectedRow - m.visibleRows + 1
		}
	}
	m.scrollOffset = max(0, min(m.scrollOffset, m.maxBrowseOffset()))
}

func (m Model) renderVisibleList() string {
	if len(m.filtered) == 0 {
		return m.styles.Subtle.Render("No themes match your search.")
	}
	startRow := max(0, min(m.scrollOffset, m.totalRows()-1))
	endRow := min(m.totalRows(), startRow+m.visibleRows)
	lines := make([]string, 0, max(m.visibleRows, endRow-startRow))
	for row := startRow; row < endRow; row++ {
		cells := make([]string, 0, m.cols)
		for col := 0; col < m.cols; col++ {
			idx := row*m.cols + col
			if idx >= len(m.filtered) {
				cells = append(cells, lipgloss.NewStyle().Width(m.colWidth).Render(""))
				continue
			}
			name := trimToWidth(m.filtered[idx].Name, m.colWidth-2)
			if idx == m.selected {
				cells = append(cells, m.styles.ListSelected.Width(m.colWidth).Render("> "+name))
			} else {
				cells = append(cells, m.styles.ListItem.Width(m.colWidth).Render("  "+name))
			}
		}
		lines = append(lines, lipgloss.JoinHorizontal(lipgloss.Top, cells...))
	}
	for len(lines) < m.visibleRows {
		lines = append(lines, "")
	}
	return strings.Join(lines, "\n")
}

func (m Model) totalRows() int {
	if len(m.filtered) == 0 {
		return 0
	}
	return (len(m.filtered) + m.cols - 1) / m.cols
}

func trimToWidth(s string, w int) string {
	if w <= 0 {
		return ""
	}
	r := []rune(s)
	if len(r) <= w {
		return s
	}
	if w == 1 {
		return "…"
	}
	return string(r[:w-1]) + "…"
}

func (m Model) installCmd(theme assets.Theme) tea.Cmd {
	return func() tea.Msg {
		w := installWriter{}
		err := apply.Run(theme, m.prepared, apply.Options{
			Stdout:      io.MultiWriter(w),
			Stderr:      io.MultiWriter(w),
			Stdin:       os.Stdin,
			Env:         os.Environ(),
			PrintHeader: true,
			LogCommand:  true,
		})
		return installDoneMsg{err: err}
	}
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
