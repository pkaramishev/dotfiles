# dotfiles

## Installation

Just run `sh install.sh`

## Troubleshooting

To rerun installation scripts run 

`chezmoi state delete-bucket --bucket=entryState`
`chezmoi state delete-bucket --bucket=scriptState`
`chezmoi apply`