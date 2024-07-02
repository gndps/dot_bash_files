# Bash Files
Manage linux packages (shell files/functions/aliases as well as other language util repos)

No interference with `.bash_profile` or `.bashrc`. They keep working like before

Because dot files are a first class citizen in `Bash Files`, they don't start with a dot.

You can use `.fdignore` to ignore the files, and they will not be sourced by `Bash Files`

# Prerequisite (Optional):
The installation script automatically installs: `jq`, `fd`

# Installation & Usage

## Installation
```
bash <(curl -s https://raw.githubusercontent.com/gndps/dot_bash_files/main/install.sh)
source $HOME/.bash_profile
```

## Configuration
Use your own config repo or the following sample config:
```
bfcli config https://github.com/gndps/dbf_config.git # sample config
```
> A config repo must have two files: `repos_config.json` and `profiles`

## Initialization

```
# bfcli init <your profile>
# Example from sample config above:
bfcli init default
```
`bfcli init` accept multiple profiles as arguments


## Customization

### Add Repos: Include bash_files compatible or non compatible repos
1. Update `config/repos_config.json`
2. For a machine specific or OS specific config, create a new file anywhere and refer it in profiles. Set the path of the custom repos_config.json file using the variable `BF_REPOS_CONFIG_FILE_OVERWRITE`. For example:
```
export BF_REPOS_CONFIG_FILE_OVERWRITE="$BASH_FILES_DIR/machine-specific/mac_dp/repos_config.json"
```

### Notes on adding repos
- Ssh keys need to be setup for private repos or ssh git urls
- Use https git urls for public repos to access without setting keys


### Machine or OS Specific
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
