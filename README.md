# Bash Files
Dot files managed using directories structure with recursive sourcing.

No interference with `.bash_profile` or `.bashrc`. They keep working like before

Because dot files are a first class citizen in `Bash Files`, they don't start with a dot.

You can use `.fdignore` to ignore the files, and they will not be sourced by `Bash Files`

# Prerequisite:
Install fd: https://github.com/sharkdp/fd

`brew install fd` # used to ignore files in `.fdignore`

# Installation
1. Clone to $HOME dir (or custom path)
2. Add the following to bash_profile and bashrc
```
# export BASH_FILES_DIR_OVERWRITE="$HOME/.bash_files" # Optional
source $HOME/.bash_files/initialize # (or custom path)
```

# License
This project is licensed under the MIT License. See the LICENSE file for details.

# Contributing
Contributions are welcome! Please submit a pull request or open an issue to discuss your changes or improvements.

# Acknowledgments
Inspired by the need to manage and source multiple Bash scripts efficiently while maintaining a clean and organized directory structure.

Feel free to modify this draft to better suit your needs or to include any additional details specific to your project.
