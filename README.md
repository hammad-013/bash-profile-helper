# bash-profile-helper

**A simple CLI tool to customize your `.bashrc` file with aliases, environment variables, PS1 prompt settings, and backup/restore support.**

![profile-helper screenshot](https://img.shields.io/badge/Bash-Script-green)  
Developed by [Hammad Shabbir](https://github.com/hammad-013)

---

## Features

- ✅ Add custom aliases to `.bashrc`
- ✅ Set environment variables
- ✅ Customize your shell prompt (PS1)
- ✅ Backup and restore your current `.bashrc`
- ✅ List all modifications made by profile-helper
- ✅ User-friendly CLI with help/version info

---

## Installation

Clone the repository and make the script executable:

```bash
git clone https://github.com/hammad-013/bash-profile-helper.git
cd profile-helper
chmod +x profile-helper.sh
```

---

## Usage

Run the script with any of the following options:
```bash
./profile-helper.sh [option]
```
Run this after customizations to apply them:
```bash
source ~/.bashrc
```

---

## Options

| Option                  | Description                               |
| ----------------------- | ----------------------------------------- |
| `--add-alias "n='cmd'"` | Add a custom alias                        |
| `--set-var "VAR=value"` | Set an environment variable               |
| `--set-ps1`             | Customize your PS1 shell prompt           |
| `--backup`              | Backup your current `.bashrc`             |
| `--restore`             | Restore `.bashrc` from backup             |
| `--list`                | List aliases/vars added by profile-helper |
| `--help`                | Display usage information                 |
| `--version`             | Show version info and author              |

---

## Examples

```bash
# Add alias
./profile-helper.sh --add-alias "ll='ls -la'"

# Set environment variable
./profile-helper.sh --set-var "EDITOR=vim"

# Customize PS1 prompt
./profile-helper.sh --set-ps1

# Backup and restore
./profile-helper.sh --backup
./profile-helper.sh --restore

# List all modifications
./profile-helper.sh --list
```

---

## Notes

- All changes are marked with `#Added by profile-helper` in your `.bashrc`.

- Backups are stored in `~/profile-helper-backups/bashrc.backup`.

- Tested on KDE Neon (Bash 5.2).
