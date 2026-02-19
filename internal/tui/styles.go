package tui

import "github.com/charmbracelet/lipgloss"

type styleSet struct {
	Doc          lipgloss.Style
	HeaderBox    lipgloss.Style
	Header       lipgloss.Style
	Subtle       lipgloss.Style
	SearchLabel  lipgloss.Style
	ListItem     lipgloss.Style
	ListSelected lipgloss.Style
	Footer       lipgloss.Style
	PanelTitle   lipgloss.Style
	Panel        lipgloss.Style
	Ok           lipgloss.Style
	Err          lipgloss.Style
}

func newStyles() styleSet {
	return styleSet{
		Doc:         lipgloss.NewStyle().Padding(1, 2),
		HeaderBox: lipgloss.NewStyle().
			Border(lipgloss.RoundedBorder()).
			BorderForeground(lipgloss.Color("62")).
			Padding(0, 1),
		Header:      lipgloss.NewStyle().Bold(true).Foreground(lipgloss.Color("86")),
		Subtle:      lipgloss.NewStyle().Foreground(lipgloss.Color("244")),
		SearchLabel: lipgloss.NewStyle().Bold(true),
		ListItem:     lipgloss.NewStyle().Foreground(lipgloss.Color("252")),
		ListSelected: lipgloss.NewStyle().Bold(true).Foreground(lipgloss.Color("86")),
		Footer:     lipgloss.NewStyle().Foreground(lipgloss.Color("245")),
		PanelTitle: lipgloss.NewStyle().Bold(true).Foreground(lipgloss.Color("69")),
		Panel: lipgloss.NewStyle().
			Border(lipgloss.RoundedBorder()).
			BorderForeground(lipgloss.Color("240")).
			Padding(0, 1),
		Ok:  lipgloss.NewStyle().Bold(true).Foreground(lipgloss.Color("42")),
		Err: lipgloss.NewStyle().Bold(true).Foreground(lipgloss.Color("196")),
	}
}
