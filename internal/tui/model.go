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
	width          int
	height         int
	search         textinput.Model
	styles         styleSet
	state          screenState
	sp             spinner.Model
	vp             viewport.Model
	prepared       assets.Prepared
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
		m.vp.SetContent(m.vp.View() + string(msg))
		m.vp.GotoBottom()
		return m, nil
	case installDoneMsg:
		if msg.err != nil {
			m.lastErr = msg.err
			m.status = "Install failed"
		} else {
			m.lastErr = nil
			if len(m.filtered) > 0 && m.selected < len(m.filtered) {
				m.status = "Installed: " + m.filtered[m.selected].Name
			} else {
				m.status = "Installed"
			}
		}
		m.state = stateResult
		return m, nil
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
			m.vp.SetContent("")
			m.status = "Installing " + m.filtered[m.selected].Name + " ..."
			return m, tea.Batch(m.sp.Tick, m.installCmd(m.filtered[m.selected]))
		}

		if key.Matches(msg, keys.Left, keys.Up) {
			m.moveUp()
			return m, nil
		}
		if key.Matches(msg, keys.Right, keys.Down) {
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

	header := m.styles.HeaderBox.Width(max(24, m.width-8)).Render(headerTitle)

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

func (m Model) renderList() string {
	if len(m.filtered) == 0 {
		return m.styles.Subtle.Render("No themes match your search.")
	}
	lines := make([]string, 0, len(m.filtered))
	for i, t := range m.filtered {
		label := "  " + t.Name
		if i == m.selected {
			lines = append(lines, m.styles.ListSelected.Width(max(16, m.vp.Width-4)).Render("> "+t.Name))
		} else {
			lines = append(lines, m.styles.ListItem.Width(max(16, m.vp.Width-4)).Render(label))
		}
	}
	return strings.Join(lines, "\n")
}

func (m *Model) moveUp() {
	if len(m.filtered) == 0 {
		return
	}
	if m.selected > 0 {
		m.selected--
	}
	m.ensureSelectedVisible()
}

func (m *Model) moveDown() {
	if len(m.filtered) == 0 {
		return
	}
	if m.selected < len(m.filtered)-1 {
		m.selected++
	}
	m.ensureSelectedVisible()
}

func (m *Model) pageMove(dir int) {
	if len(m.filtered) == 0 {
		return
	}
	delta := max(1, m.visibleRows)
	if dir < 0 {
		m.selected = max(0, m.selected-delta)
	} else {
		m.selected = min(len(m.filtered)-1, m.selected+delta)
	}
	m.ensureSelectedVisible()
}

func (m *Model) resizeLayout() {
	m.vp.Width = max(20, m.width-14)
	m.vp.Height = max(5, m.height-13)
	m.visibleRows = max(1, m.height-13)
}

func (m Model) maxBrowseOffset() int {
	if len(m.filtered) == 0 {
		return 0
	}
	return max(0, len(m.filtered)-m.visibleRows)
}

func (m *Model) ensureSelectedVisible() {
	if len(m.filtered) == 0 {
		m.selected = 0
		m.scrollOffset = 0
		return
	}
	m.selected = max(0, min(m.selected, len(m.filtered)-1))
	if m.selected < m.scrollOffset {
		m.scrollOffset = m.selected
	} else {
		lastVisible := m.scrollOffset + m.visibleRows - 1
		if m.selected > lastVisible {
			m.scrollOffset = m.selected - m.visibleRows + 1
		}
	}
	m.scrollOffset = max(0, min(m.scrollOffset, m.maxBrowseOffset()))
}

func (m Model) renderVisibleList() string {
	if len(m.filtered) == 0 {
		return m.styles.Subtle.Render("No themes match your search.")
	}
	start := max(0, min(m.scrollOffset, len(m.filtered)-1))
	end := min(len(m.filtered), start+m.visibleRows)
	lines := make([]string, 0, max(m.visibleRows, end-start))
	rowWidth := max(16, m.width-18)
	for i := start; i < end; i++ {
		if i == m.selected {
			lines = append(lines, m.styles.ListSelected.Width(rowWidth).Render("> "+m.filtered[i].Name))
		} else {
			lines = append(lines, m.styles.ListItem.Width(rowWidth).Render("  "+m.filtered[i].Name))
		}
	}
	for len(lines) < m.visibleRows {
		lines = append(lines, "")
	}
	return strings.Join(lines, "\n")
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
