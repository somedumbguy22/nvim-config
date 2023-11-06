# Shell Setup
- [MS PowerToys](https://learn.microsoft.com/en-us/windows/powertoys/)
- [ZSH + Powershell10K]()
	- [ZSH on WSL](https://blog.joaograssi.com/windows-subsystem-for-linux-with-oh-my-zsh-conemu/)
	- [General Instructions](https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0)
- [FZF - Fuzzy Finder and History Search](https://github.com/junegunn/fzf)
	- [History Search](https://github.com/joshskidmore/zsh-fzf-history-search)
[Installing Fonts on Windows](https://support.microsoft.com/en-us/office/add-a-font-b7c5f17c-4426-4b53-967f-455339c564c1)
- [Nerd Fonts - Windows](https://www.nerdfonts.com/font-downloads)
	- [Install a Nerd Font](https://learn.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup)
- [GH - Github CLI Manager](https://cli.github.com/)
	- [Installation Instructions for Linux/WSL](https://github.com/cli/cli#installation)
- [ASDF Version Manager](https://github.com/asdf-vm/asdf)
	- [Getting Started with ASDF](https://asdf-vm.com/guide/getting-started.html)
	- [Setting ASDF as ZSH Plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf)


# Languages: 
#### Nodejs
{Required for IDE setup}
There's a WSL bug and you need to install node from the source binary. [Instructions](https://github.com/nodesource/distributions)
```
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

NODE_MAJOR=21

echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

sudo apt-get update
sudo apt-get install nodejs -y

```

There's another WSL bug where it tries to access npm as a Windows executable and not from the /usr/bin command reference. [Issue Reference](https://github.com/microsoft/WSL/issues/1896)
- Solution: Restart the shell and it should overwrite to the new, correct version

#### Python3
(This is only to support python as a programming language)
WSL comes with python3 v3.10.X. [Installation Reference](https://docs.python-guide.org/starting/install3/linux/) To upgrade:
```
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.12

echo 'alias python3=python3.12' >> ~/.zshrc
echo 'alias py=python3' >> ~/.zshrc
source ~/.zshrc

```

#### Ensurepip
```
sudo apt install python3.12-venv
```

#### Rust
- [Rust](https://www.rust-lang.org/)
#### C#/.NET
- [.NET/C#](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)
#### Elixir
- [Elixir](https://github.com/elixir-lang/elixir/releases) + [Erlang](https://www.erlang.org/downloads)
	- [ASDF Elixir](https://github.com/asdf-vm/asdf-elixir)
	- [ASDF Erlang](https://github.com/asdf-vm/asdf-erlang)
	- [ASDF Usage Example for Elixir + Erlang](https://elixirforum.com/t/upgrading-elixir-how-to-check-versions-delete-and-upgrade/15908/6)


# IDE: [NeoVim](https://neovim.io/)

#### Default Installation Information 
Not Preferred: Doesn't have latest versions available
- [Install Information](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- [Updated Package Manager information](https://vi.stackexchange.com/questions/25192/how-to-install-stable-version-of-neovim-on-ubuntu-18-04)
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

#### Bob Version Manager Installation Guide: 
Preferred: Has all versions available and can switch between any easily
- [Install Rust/Cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html)
- Prefered: Install the [NeoVim Package Manager: Bob](https://github.com/MordechaiHadad/bob)
```
cargo install --git https://github.com/MordechaiHadad/bob.git
bob install latest
```

The installation and executable is stored by default into the `~/.local/share/bob/v0.9.1/nvim-linux64/bin`  location

- Add the alias for vim to nvim in the .zshrc file in `~` (home) or run the following
```
echo 'alias vim=nvim' >> ~/.zshrc 
echo 'alias nvim=~/.local/share/bob/v0.9.1/nvim-linux64/bin/nvim' >> ~/.zshrc
```

#### NvChad for NeoVim Guide:
- Make sure to have Nerd Fonts installed (see above shell setup) for your shell
	- On this topic, some of the folder icons may not show up properly. Apparently the [solution is to update nerd fonts](https://github.com/NvChad/NvChad/issues/2023) from [v3.0 to v3.0.1](https://github.com/NvChad/NvChad/issues/2034) or lower than v3.0 to v.30. This did not work for me. My fix was to update the default icon in nvimtree lua config to a different text icon.

```
nvim ~/.config/nvim/lua/plugins/configs/nvimtree.lua
/glyphs //in normal mode
update the folder = {
	default = "<icon>" //to the same as the empty folder icon
}
```

- [NvChad - NeoVim Primary Config](https://github.com/NvChad/NvChad)
	- Install cmd:
```
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
```

#### Setting Up NvChad + NeoVim
- Set a Theme: `[SPACE] T H` and select your theme. 
- NVim comes with [Tree Sitter](https://github.com/nvim-treesitter/nvim-treesitter) pre-installed, and this is used for syntax highlighting
	- To download syntax highlighting, use the `:TSInstall <lang>` command in *normal* vim mode
	- To check which packages have been enabled by Tree Sitter, use `:TSInstallInfo` 
		- This command only works after installing something first (based on my testing)
examples:
```
:TSInstall exlixir
:TSInstall c_sharp
:TSInstall rust
:TSInstall python
```

#### Plugins in NVim with Lua
- In the  `~/.config/nvim/lua/custom/` directory is where the main NvChad customizations live. I've created a new `plugins.lua, mappings.lua, configs/lspconfig.lua, null-ls.lua` files in this directory, and referenced that from the `chadrc.lua` file. Here we can add in custom language support plugins and other items as needed.
```
local M {}
M.ui = {...}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
```

In the `plugins.lua` file is where the config settings for each plugin lives (e.g., for debugging, static analysis, etc.) You can also ensure all the all the appropriate plugins are installed by defaul here with [Mason.nvim](https://github.com/williamboman/mason.nvim). In *normal* mode:
```
:MasonInstallALL //Install all mason plugins you've configured in the plugins file
:Mason //brings up the UI
```
#### Language Server Protocol (LSP) in NVim and NvChad
Here we can configure LSP settings in the `configs/lspconfig.lua` file.
- Reference: [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

##### C# LSP with Omnisharp-Roslyn
- Not Recommended: Can install [omnisharp-roslyn](https://github.com/OmniSharp/omnisharp-roslyn) by adding the [latest version](https://github.com/OmniSharp/omnisharp-roslyn/releases) 
- Recommended: Use [Mason.nvim](https://github.com/williamboman/mason.nvim) to add the LSP via their supported [csharp-language-server](https://mason-registry.dev/registry/list#csharp-language-server) package
##### Python LSP:
- [Pyright](https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/pyright.lua), install via Mason.nvim
##### Python Static Analysis
- [Null-LS](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md)
##### Python Debugging Tools
- [nvim-dap](https://github.com/mfussenegger/nvim-dap), 
- [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)

#### Setting up a Clipboard Provider
Neovim supports providers for certain functions, namely the clipboard. If running on WSL2, even though the Ubuntu OS you're running comes with [xclip](https://github.com/astrand/xclip)as a provider to "translate" the yank command from (neo)vim to your system clipboard, this won't work on windows, as it's missing some components required to function. Instead, open a Powershell instance (as administrator - via `PS> Start-Process powershell -Verb runAs` and then install `win32yank` via *chocolatey*

```
choco install win32yank
```

Start a new ubuntu shell, open neovim and run the health check, via `:checkhealth`. You should now see win32yank listed as the clipboard provider.

Note: Vim clipboard options are configured in neovim via the `lua/core/init.lua` file, under the `opts.clipboard` parameter. This is where the default vim clipboard behavior is changed to "unnamedplus". [See Referece](https://neovim.io/doc/user/provider.html#clipboard)


#### Operating NVim and NvChad
- NVim Cheat Sheet: `[SPACE] c h`
- Open the File System Viewer with `[CTRL] n`
- Some quick commands for File Editing: 
	- `[SPACE]` is the *leader* key in NVim, and is used to access special NVim commands (separate from the regular vim command palette). This key will also bring up some suggestions on which keys to hit next for certain actions
	- `m` to mark a file
	- `a` to create a new file
	- `c` and then `p` to copy and paste a file into a new location
	- `r` to rename files
	- `d` to delete files (requires a `y/n` confirmation in the command section)
	- `[SPACE] f f` to open the find files window and you can search for files to open
	- `[SPACE] f b` will search and only open files that are current open (the `b` is for buffer)
Some Useful Buffer Editing commands (from *normal* mode):
- `[CTRL-V]` to enter *visual block mode*. You can then highlight a block of text and use the regular vim commands to either copy it or cut it from the buffer
	- `y` to copy (yank)
	- `d` to cut (delete)
	- `p` to paste or `P` to paste before the current cursor position 
- `dd` to delete the current line
- `gg` to go to the top of the buffer
- `G` to go to the end of the buffer
- `/` to search the current buffer for text (accepts regex)
- `:s/find/replace` to find and replace text in a buffer
- Navigation around windows:
	- `[TAB]` for navigating through open file tabs/buffers. This can be used to open specific files within those `:vsp` or `:sp` windows that are open.
	- Vim command `:vsp` or `:sp` for opening up new windows either vertically or below, horizontally
		- If you only have a single file open, the new window will have the same file as the original/primary window. To open a new file there, go to the file tree and open a file. It will prompt you with which window to open that file in with *a, b, c, etc.*
		- If you already have multiple files open, go to the new window and just hit `[TAB]` until the correct file from an already open buffer is viewable and editable
		- `[SPACE] x`  or `:(w)q` to close a specific active window, or any normal vim command will apply to the active buffer only
	- Then, `[CTRL] + h, j, k, or l` for moving around various parts of the windows/screen (including the file navigation tree!)
- Opening the Terminal from NVim
	- `[SPACE] v` or `[SPACE] h` for a vertical or horizontal window, respectively
- Debugging:
	- `[SPACE] db` to set a breakpoint
	- `[SPACE] dpr` to run the debugger and execute test cases
	These commands are custom configured in the `custom/mappings.lua` file
