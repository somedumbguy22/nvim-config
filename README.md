This version of the config is for neovim 0.10.0 and NvChad 2.5
# Shell Setup
- [MS PowerToys](https://learn.microsoft.com/en-us/windows/powertoys/)
- [ZSH + Powershell10K]()
	- [ZSH on WSL](https://blog.joaograssi.com/windows-subsystem-for-linux-with-oh-my-zsh-conemu/)
	- [General Instructions](https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0)
- [FZF - Fuzzy Finder and History Search](https://github.com/junegunn/fzf)
	- [History Search](https://github.com/joshskidmore/zsh-fzf-history-search)
- [Inshellisense](https://github.com/microsoft/inshellisense)
[Installing Fonts on Windows](https://support.microsoft.com/en-us/office/add-a-font-b7c5f17c-4426-4b53-967f-455339c564c1)
- [Nerd Fonts - Windows](https://www.nerdfonts.com/font-downloads)
	- [Install a Nerd Font](https://learn.microsoft.com/en-us/windows/terminal/tutorials/custom-prompt-setup)
- [GH - Github CLI Manager](https://cli.github.com/)
	- [Installation Instructions for Linux/WSL](https://github.com/cli/cli#installation)

# Languages: 
#### Nodejs
**Updated**: Use [nvm](https://github.com/nvm-sh/nvm) to install and manage node

```shell
sudo apt-get update
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/<version>/install.sh | bash
# This automatically adds the following to your .zshrc (or bash) profile
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To verify installation
command -v nvm

#Install node.js
nvm install node # "node" is an alias for the latest version
nvm install 14.7.0 # or 16.3.0, 12.22.1, etc
nvm alias my_alias v14.4.0

nvm run node --version

nvm install-latest-npm
```

**Outdated:**
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

### Default Installation Information 
**Not Preferred**: Doesn't have latest versions available
- [Install Information](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- [Updated Package Manager information](https://vi.stackexchange.com/questions/25192/how-to-install-stable-version-of-neovim-on-ubuntu-18-04)
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

### Bob Version Manager Installation Guide: 
**Preferred**: Has all versions available and can switch between any easily
- [Install Rust/Cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html)
- Prefered: Install the [NeoVim Package Manager: Bob](https://github.com/MordechaiHadad/bob)
```
cargo install --git https://github.com/MordechaiHadad/bob.git
bob install latest
```

The installation and executable is stored by default into the `~/.local/share/bob/vX.X.X/nvim-linux64/bin`  location

- Add the alias for vim to nvim in the .zshrc file in `~` (home) or run the following
```
echo 'alias vim=nvim' >> ~/.zshrc 
echo 'alias nvim=~/.local/share/bob/v0.9.1/nvim-linux64/bin/nvim' >> ~/.zshrc
```

Be sure to install [ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation) for telescope to function properly (and optionally [fd](https://github.com/sharkdp/fd))
```
sudo apt install ripgrep && rg --version
sudo apt install fd-find
```
- `fd` may require `cargo` and Rust to be installed first. You may also need to add the following to your `~/.zshrc` to use `fd`
```
alias fd="/usr/lib/cargo/bin/fd"
```
### NvChad for NeoVim Guide:
As of NvChad 2.5, the project comes with 2 configurations. The base configuration lives in the repo and is called by the *starter* config. This allows the user's configuration to be more lightweight and won't involve all of the core config that's needed for a good experience. It's possible to overwrite any of the base config, however, for customization.

- [NvChad](https://github.com/NvChad/NvChad) 
	- This is the main repo for NvChad and its development.
	- It contains all the plugins, options, mappings, autocmds
	- All of its modules are in `/nvchad`
- [NvChad Starter](https://github.com/NvChad/starter)
	- Config which uses the NvChad repo as a plugin.
	- Users will be using the starter config as a base.
	- Imports nvchad modules, ex: `require("nvchad.options")`.

- [NvChad - NeoVim Primary Config](https://github.com/NvChad/NvChad)
	- Install cmd:
```
cp -r ~/.local/share/nvim ~/.local/share/nvim-<version>-bak
cp -r ~/.local/state/nvim ~/.local/state/nvim-<version>-bak
cp -r ~/.config/nvim ~/.config/nvim-<version>-bak
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.config/nvim
git clone https://github.com/NvChad/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

### Setting Up NvChad + NeoVim
- When you start neovim for the first time, the `lazy` package manager will boot up and install the [default plugins](https://nvchad.com/docs/config/plugins) and set up the editor for first use.
	- I will go into detail about each plugin below
- Set a Theme: `[SPACE] T H` and select your theme. 
	- I chose `penumbra_light`
- Make sure to have Nerd Fonts installed (see above shell setup) for your shell
	- On this topic, some of the folder icons may not show up properly. Apparently the [solution is to update nerd fonts](https://github.com/NvChad/NvChad/issues/2023) from [v3.0 to v3.0.1](https://github.com/NvChad/NvChad/issues/2034) or lower than v3.0 to v.30. This did not work for me. My fix was to update the default icon in nvimtree lua config to a different text icon.
	- [NvimTree](https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/nvimtree.lua) does not come with an override file in the NvChad 2.5 starter, so I created a new file under `/lua/configs/nvimtree.lua` and overwrote the base config with my own. The key section is the `glyphs` block under the `renderer` component. I've included my glyphs as part of the `glyphs.txt` file as well.

```
touch ~/.config/nvim/lua/configs/nvimtree.lua
nvim ~/.config/nvim/lua/configs/nvimtree.lua
// Update the glyphs as needed
```
- The default configuration has a few notable files and directories:
	- `init.lua`: This is required for all neovim configurations and this one specifies a few things specific to how NvChad is setup. No need to modify this file (usually)
	- `/lua/chadrc.lua` is for some basic neovim settings, like the current theme. I haven't modified this at all
	- `/lua/mappings.lua` is where to keep any custom key mappings. Here you can use the local variable `map` (which is the same as `vim.keymap.set`) to create custom bindings
		- For example: I have a custom binding to use `<leader> + k` to have code diagnostic information (warnings and errors) appear as a hover window for more legibility. Otherwise, the messages can go off screen
	- `/lua/plugins/init.lua` is where to keep any additional plugin configurations or modify any existing plugins (from `lazy.nvim`). 
		- These plugins are not to be confused with utilities installed via Mason (see below)
		- You can add additional files here as necessary if the plugin specification gets too long for a single file or creates clutter
	- `/lua/configs/` is where any additional code should be kept for plugin customization. It's usually a good idea just to call a file from here and keep the base plugin init under the `/lua/plugins/init.lua` file

### Plugins in NVim with Lua
NvChad comes with a bunch of plugins installed by default, and I've added a few extra for my config. Each are listed below for reference:
#### Base Plugins
These are the primary plugins that come with NvChad and they do the bulk of the heavy lifting. These are critical to developing a custom editor that suites your needs
##### Lazy.nvim
NvChad uses [lazy.nvim](https://github.com/folke/lazy.nvim) to load plugins. The default plugins are installed the first time you load up neovim. Other plugins can be specified in the `/lua/plugins/` folder. 
- For now, I keep my plugin configuration mostly in the `/lua/plugins/init.lua` file, with only a few specific configurations making it out to a separate file in the `lua/configs/<plugin_name>.lua` directory.
- To pull up the lazy plugin manager, write the command (in *normal mode*) - `:Lazy`
##### Mason.nvim
NvChad uses [Mason](https://github.com/williamboman/mason.nvim) to help with external dependencies to neovim. This is essentially a package manager, just like `apt` or `brew`. 
- You can  ensure all the all the currently configured plugins are installed by default) by running the command (in *normal* mode):
```
:MasonInstallALL //Install all mason plugins you've configured in the plugins file
```
- The below command brings up a helpful UI where you can browse new packages or update existing ones
```
:Mason //brings up the UI
```
- I generally like to install code specific LSPs and Debuggers via Mason, instead of separately via a traditional CLI package manager. For example, I've installed [ElixirLS](https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/elixirls.lua) (see below section on [Elixir-Tools.nvim](#elixir-tools.nvim)) this way and then I can I just point my LSP configurations at a common install directory each time.
	- The install directory for Mason plugins (on Linux) is: `~/.local/share/nvim/mason/packages/<package_name>/`
##### Nvim-TreeSitter
NvChad comes with [Tree Sitter](https://github.com/nvim-treesitter/nvim-treesitter) pre-installed, and this is used for syntax highlighting
- To download syntax highlighting, use the `:TSInstall <lang>` command in *normal* vim mode
	- You can see the list of available languages [here](https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages)
- To check which packages have been enabled by Tree Sitter, use `:TSInstallInfo` 
	- This command only works after installing something first (based on my testing)
examples:
```
:TSInstall elixir
:TSInstall c_sharp
:TSInstall rust
:TSInstall python
```

##### Plenary.nvim
[Plenary.nvim](https://github.com/nvim-lua/plenary.nvim) is a libary that makes writing various lua functions much easier. It's critical as it's a dependency for a lot of other critical plugins.
##### Nvim-tree
[Nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) is a file explorer plugin for Neovim. It enables viewing the project directory and any subdirectories with ease. As mentioned above, it also supports nerd fonts, and so comes with some nice looking (and configurable) icons for different file types. 
- To use this plugin with the default settings for NvChad:
	- To pull up the tree from any view, hit - `[CTRL] + n`
	- You can navigate to the tree from any other buffer, via the vim navigation keys, with a `[CTRL]` modifier - `[CTRL] + h` | `[CTRL] + j` | `[CTRL] + k` | `[CTRL] + l`
	- Alternatively, if you want to highlight the tree from anywhere - `<leader> + e`
- In *normal mode*, you can also perform common vim functions:
	- `a` to add a file or directory
	- `d` to delete a file or directory
	- `y` to copy and entire file or directory
	- `r` to rename a file or directory
##### Conform.nvim
[Conform.nvim](https://github.com/stevearc/conform.nvim) is a lightweight formatter plugin for Neovim. It has support for many, many languages out of the box and also provides nice-to-have features, such as "format on save." It also improves LSP performance by hooking into the LSP and ensuring the formatting is efficient (as opposed to replacing an entire buffer on format, for example).
- To enable format on save:
```
{
	"stevearc/conform.nvim",
    event = 'BufWritePre', -- this is the key line to enable format on save
    opts = ...,
}
```

##### Nvim-LspConfig
[Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) is a plugin that allows developers to easily import and configure language server protocols (LSPs) into their NeoVim setup
- NvChad comes with some default methods (e.g., `on_attach`, `on_init`, and `capabilities`) that work nicely with most LSPs
	- These methods come with vim motions to allow you to use their features easily. Not all default motions will work with all LSPs, however, so be sure to check the configuration against the LSPs real capabilities and modify as needed.
		- Some example default actions:
			- `g + d` -  Go to Definition
			- `g + i` - Go to Implementation
			- `<leader> + sh` - Show Signature Help
			- `<leader> + ra` - LSP renamer
	- LSPConfig also comes with some vim commands that are useful to troubleshoot a misbehaving LSP. Example commands - type (in *normal* mode):
		- `:LspInfo` to see if there's an attached LSP to the current buffer and what options are enabled
		- `:LspLog` to see the log file for the LSP to debug issues or check for errors. You can also see a list of info logs detailing actions the LSP is taking
		- `:LspStart`, `:LspRestart` and `:LspStop` are all useful for obvious reasons
- When using the default configuration loaded in NvChad (in the `/lua/configs/lspconfig.lua` file, be sure to look at the appropriate name from the `server_configurations.md` and match to the appropriate backend LSP here: [Server_Configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
##### Nvim-cmp
[Nvim-cmp](https://github.com/hrsh7th/nvim-cmp) is a code completion engine for Neovim. It hooks into LSPs to provide code snippets and "intellisense" like completion capabilities.
##### Telescope.nvim
[Telescope](https://github.com/nvim-telescope/telescope.nvim) is a extendable, fuzzy finder plugin. It's used to search/grep across files in your project, search a buffer locally, and a lot more. Some example usage:
- Most of the telescope functions are configured under the `<leader> + f` combination in NvChad
- To search for a file and see a preview window of the file: `<leader> + ff`
- To grep within an active buffer: `<leader> + fz`
- To search across all open buffers: `<leader> + fb`
- To perform a live grep for more complex searches across a project: `<leader> + fw`
#### Quality of Life Plugins
These plugins come with NvChad and add small but important features to the coding experience. I've just listed them here for reference:
- [NvChad/Base64](https://github.com/NvChad/base46)
- [Nvim-Web-Devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [NvChad/UI](https://github.com/NvChad/ui)
- [Indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [Nvim-Autopairs](https://github.com/windwp/nvim-autopairs)
- [NvChad/Nvim-colorizer](https://github.com/NvChad/nvim-colorizer.lua)

#### Additional Plugins
These are plugins I've found helpful and installed myself for my specific languages and workflows
##### Elixir-Tools.nvim
[Elixir-tools.nvim](https://github.com/elixir-tools/elixir-tools.nvim) provides a few elixir integrations out of the box, from a single plugin. It makes it (a little) easier to get started using elixir tools, like the [ElixirLS](https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/elixirls.lua) LSP. I personally found this easier to configure than just using NvChad's built in LSP integration area, though I still leverage the default methods that NvChad exposes to help set useful key bindings and other capabilities.
- I kept my config for elixir-tools in my `/lua/plugins/init.lua` file, but I plan on refactoring this out to its own file under the configs directory at some point. The entire `config()` function should be moved
- A note: Elixir-tools supports multiple LSPs (e.g., [next-ls](https://github.com/elixir-tools/next-ls) & [credo-language-server](https://github.com/elixir-tools/credo-language-server)), but these appear to be [getting phased out and merged into the main ElixirLS project](https://www.elixir-tools.dev/news/introducing-next-ls-and-an-elixir-tools-update/), so no need to enable those at this time.
	- One set of features to watch is [code actions](https://www.elixir-tools.dev/docs/next-ls/code-actions/). These code actions are available in next-ls, but not in ElixirLS, as far as I can tell. Once these features get moved over to the main project, they can be configured in NeoVim for convience. 
		- The default code actions key map is: `<leader> + ca` 
##### Nvim-DAP & Nvim-DAP-UI
//TO DO:
I'm still working on configuring this at the moment and haven't worked out all the kinks

#### Setting up a Clipboard Provider
Neovim supports providers for certain functions, namely the clipboard. If running on WSL2, even though the Ubuntu OS you're running comes with [xclip](https://github.com/astrand/xclip)as a provider to "translate" the yank command from (neo)vim to your system clipboard, this won't work on windows, as it's missing some components required to function. Instead, open a Powershell instance (as administrator - via `PS> Start-Process powershell -Verb runAs` and then install `win32yank` via *chocolatey*

```
choco install win32yank
```

Start a new ubuntu shell, open neovim and run the health check, via `:checkhealth`. You should now see win32yank listed as the clipboard provider.

Note: Vim clipboard options are configured in neovim via the `lua/init.lua` file, under the `opts.clipboard` parameter. This is where the default vim clipboard behavior is changed to "unnamedplus". [See Reference](https://neovim.io/doc/user/provider.html#clipboard) & [NvChad Recipes](https://nvchad.com/docs/recipes)
#### Operating NVim and NvChad
Note: I wrote the commands as I learned them (or configured them). Some have already been listed in the above configuration sections, but this is a convenient, searchable list (at least for me :))
- NVim Cheat Sheet: `[SPACE] c h`
- Open the File System Viewer with `[CTRL] n`
- Find and Open a file with a preview with `<leader> ff`
- Some quick commands for File Editing: 
	- `[SPACE]` is the *leader* key in NVim, and is used to access special NVim commands (separate from the regular vim command palette). This key will also bring up some suggestions on which keys to hit next for certain actions
	- `m` to mark a file
	- `a` to create a new file
	- `c` and then `p` to copy and paste a file into a new location
	- `r` to rename files
	- `d` to delete files (requires a `y/n` confirmation in the command section)
	- `[SPACE] f f` to open the find files window and you can search for files to open
	- `[SPACE] f b` will search and only open files that are current open (the `b` is for buffer)
	- Toggle Relative Line Numbers: `<leader> rn`
Some Useful Buffer Editing commands (starting from *normal* mode):
- [Visual Mode](https://builtin.com/articles/vim-visual-mode)`v` to enter *character-wise* visual mode, `[SHIFT + v` or `V` to enter *line-wise* visual mode, or `[CTRL-V]` to enter *visual block mode*. You can then highlight a block of text and use the regular vim commands to either copy it or cut it from the buffer
	- `y` to copy (yank)
	- `d` to cut (delete)
	- `p` to paste or `P` to paste before the current cursor position
	- `x` to remove multi-line comments (Note: only highlight the comment symbol(s) here i.e., don't highlight the entire line, only the `//` or `#` or whatever)
	- For multi-line comments: `[SHIFT + i]` (insert mode) -> `//` or `#` or whatever the comment indicator is for the language -> `[ESC]` and it will appear on all lines
- `s` to substitute will delete the current character and place the user in insert mode with the cursor between the two surrounding characters. `3s`, for example, will delete the next three characters and place the user in insert mode.
- `c` to change takes a vim motion (such as `w`, `j`, `b`, etc.). It deletes the characters from the current cursor position up to the end of the movement. Note that this means that `s` is equivalent to `cl` (vim documentation itself claims these are synonyms).
	- A common and useful motion is `ciw` for "change inner word". This will delete the current word, no matter where the cursor is on the word, delete the word, and place you in insert mode.
- `r` (replace) never enters insert mode at all. Instead, it expects another character, which it will then use to replace the character currently under the cursor.
- `dd` to delete the current line
- `yy` to copy the current line
- `gg` to go to the top of the buffer
- `G` to go to the end of the buffer
- `/` to search the current buffer for text (accepts regex)
	- When searching, hit enter and then `n` to iterate through results (wraps). `<S-n> or N` to iterate in the reverse direction
	- `?` instead of the `/` to make the search look "up" the document, instead of below or "down"
	- `*` (forward) or `#` (reverse) on any word automatically enters the word into the search buffer and you can hit `n` or `<S-n> or N` to iterate through the results
- `$` to go to the end of a line
- `(` and `0` to go to the beginning of the text and beginning of the line, respectively
- `f + <character you want to jump to>` to move the cursor to the next instance of that character, `<S-f> or F` to backwards
- `<number of lines> + k or j` to jump a specific number of lines up or down. Very useful with relative line numbers turned on
- `:s/find/replace` to find and replace text in a buffer
- Navigation around windows:
	- `[TAB]` for navigating through open file tabs/buffers. This can be used to open specific files within those `:vsp` or `:sp` windows that are open.
	- Nvim Command `<C-w> s` to split the current buffer into 2 (below)
	- Vim command `:vsp` or `:sp` for opening up new windows either vertically or below, horizontally
		- If you only have a single file open, the new window will have the same file as the original/primary window. To open a new file there, go to the file tree and open a file. It will prompt you with which window to open that file in with *a, b, c, etc.*
		- If you already have multiple files open, go to the new window and just hit `[TAB]` until the correct file from an already open buffer is viewable and editable
		- `[SPACE] x`  or `:(w)q` to close a specific active window, or any normal vim command will apply to the active buffer only
	- Then, `[CTRL] + h, j, k, or l` for moving around various parts of the windows/screen (including the file navigation tree!)
- Opening the Terminal from NVim
	- `[ALT] i` for a floating terminal
	- `[SPACE] v` or `[SPACE] h` for a vertical or horizontal window, respectively. 
		- Note this will create a new terminal session
	-  `[ALT] h or [ALT] v` hides and restores an existing terminal session (h for your last horizontal session and v for your last vertical session respectively)
- Debugging:
	- `[SPACE] db` to set a breakpoint
	- `[SPACE] dpr` to run the debugger and execute test cases
	- `<SPACE] f` to pull up the floating diagnostics message for an LSP marked line
	- `<S-k> or K` to inspect a variable for information, like typing
	- `gd` for Goto Definition
	- `[d` to go to the previous diagnostic and `]d` to go to the previous (warning or error)
	- `<leader>k` to open the line diagnostics into a floating window for better visibility. This is useful when the message goes off screen or spans multiple lines. This is a custom mapping I built, from this [issue](https://www.reddit.com/r/neovim/comments/11axh2p/how_to_toggle_openclose_floating_lsp_diagnostic/)

# VS Code - Editor

### Themes
- [Henna Color Theme](https://marketplace.visualstudio.com/items?itemName=httpsterio.henna)
- [Terminal Font (Matches Powershell10k)](https://github.com/romkatv/powerlevel10k/blob/master/font.md)

### Extensions
#### C Sharp/.NET
 - [.NET Core Test](https://marketplace.visualstudio.com/items?itemName=formulahendry.dotnet-test-explorer)
 - [.NET Install Tool for Extension Authors](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.vscode-dotnet-runtime)
 - [C#](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp)
 - [Dotnet Core Essentials](https://marketplace.visualstudio.com/items?itemName=kishoreithadi.dotnet-core-essentials)
 - [ilspy-vscode](https://marketplace.visualstudio.com/items?itemName=icsharpcode.ilspy-vscode)
 - [MSBuild project tools](https://marketplace.visualstudio.com/items?itemName=tintoy.msbuild-project-tools)
 - [Phoenix Framework](https://marketplace.visualstudio.com/items?itemName=phoenixframework.phoenix)

#### Rust Lang
- [Rust](https://github.com/editor-rs/vscode-rust)

#### Elixir + Phoenix
- [Elixir Test](https://marketplace.visualstudio.com/items?itemName=samuel-pordeus.elixir-test)
- [ElixirLS: Elixir support and debugger](https://marketplace.visualstudio.com/items?itemName=JakeBecker.elixir-ls)

#### Other
- [GitLens — Git supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyterc)
- [Jupyter Cell Tags](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.vscode-jupyter-cell-tags)
- [Jupyter Keymap](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter-keymap)
- [Jupyter Notebook Renderers](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter-renderers)
- [Jupyter Slide Show](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.vscode-jupyter-slideshow)
- [Polyglot Notebooks](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.dotnet-interactive-vscode)
- [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client)
- [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)
- [WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)

# Other
- [PostgreSQL](https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-database)
