# Bash Files
Dot files managed using directories structure with recursive sourcing.

No interference with `.bash_profile` or `.bashrc`. They keep working like before

Because dot files are a first class citizen in `Bash Files`, they don't start with a dot.

You can use `.fdignore` to ignore the files, and they will not be sourced by `Bash Files`

# Prerequisite:
### Mac:
```
brew install fd # used to ignore files in `.fdignore` (https://github.com/sharkdp/fd)
brew install jq # used to read `.bfconfig` file(s)
```
### Linux
```
apt install fd jq
```

# Installation
```
bash <(curl -s https://raw.githubusercontent.com/gndps/dot_bash_files/main/install.sh)
```

# Customization

## Include bash files compatible or non compatible repos
1. Update `config/.bfconfig`
2. For a machine specific or OS specific config, create a new file anywhere and refer it in profiles. Set the path of the custom .bfconfig file using the variable `BFCONFIG_FILE_OVERWRITE`. For example:
```
export BFCONFIG_FILE_OVERWRITE="$BASH_FILES_DIR/machine-specific/mac_dp/.bfconfig"
```


## Machine or OS Specific
1. Update `config/profiles`. For example, you add new profile called `[ubuntu]`.
2. Run `bfcli init ubuntu` to apply the profile. Note that it will not uninstall old profiles.
3. Commit changes.



# Uninstall
1. `rm -rf $HOME/.bash_files`
2. Update bash_profile and bashrc to remove entries


# License
This project is licensed under the MIT License. See the LICENSE file for details.

# Contributing
Contributions are welcome! Please submit a pull request or open an issue to discuss your changes or improvements.

# Acknowledgments
Inspired by the need to manage and source multiple Bash scripts efficiently while maintaining a clean and organized directory structure.

Feel free to modify this draft to better suit your needs or to include any additional details specific to your project.
