# dotfiles

## Installation

### MacOS

```bash
curl -fsSL https://raw.githubusercontent.com/pkaramishev/dotfiles/refs/heads/main/install.sh | bash
```

### Windows

```bash
curl -fL -o install.bat https://raw.githubusercontent.com/pkaramishev/dotfiles/refs/heads/main/install.bat && install.bat && del install.bat
```

## Troubleshooting

To rerun installation scripts use 

```bash
chezmoi state delete-bucket --bucket=entryState
chezmoi state delete-bucket --bucket=scriptState
chezmoi apply
```