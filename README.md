# VIDE: Vim IDE

VIDE ("Vim IDE") is intended to turn Vim into a decent programming IDE via the use of plugins and configs, via a reproducible Vim configuration system—designed to be cloned, bootstrapped, and sandboxed anywhere, without risk to your real Vim environment.

NOTE: This software has NOT been tested; it has primarily been created as a means to recreate a Vim installation for my own personal workflow.

run vim-bootstrap.sh [homedir] to install.

## Features

- **Sandboxed:** Never trashes your real `~/.vim` or `~/.vimrc`—everything goes into a user-specified directory.
- **Plugin-managed:** Uses [vim-plug](https://github.com/junegunn/vim-plug) for plugins.
- **CoC-ready:** Installs required [CoC extensions](https://github.com/neoclide/coc.nvim) for full LSP/autocomplete workflow.
- **Automated:** One script, full setup in under 2 minutes.
- **Configurable:** Easy to swap, add, or update configs, plugins, and extensions.

---

## Quickstart

### 1. **Install Dependencies**

VIDE requires:

- Vim 9.1+ (other versions may work, only 9.1 tested)
- `curl`
- `python3`
- `nodejs`
- `npm`

On Ubuntu:

```bash
sudo apt install vim curl python3 nodejs npm
```

### 2. **Clone This Repo**

```bash
git clone https://github.com/YOURUSERNAME/VIDE.git
cd VIDE
```

### 3. **Run the Bootstrap Script**

```bash
./vide-bootstrap.sh ./sandbox
```

- This will set up all configs, plugins, and CoC extensions in the `./sandbox` directory.
- Your real `.vim` and `.vimrc` are untouched.
- You can specify any directory in place of `./sandbox` for a different environment.

---

## Repo Structure

```
VIDE/
│
├── vide-bootstrap.sh        # The all-in-one installer script
├── configs/
│   ├── .vimrc              # Main vim config
│   └── coc-settings.json   # CoC config
├── (optionally: snapshot.coc for CoC plugin snapshots)
└── README.md               # This file
```

---

## How It Works

- **Script checks dependencies and all config files up front.**
- **Creates all needed directories in your chosen sandbox location.**
- **Copies configs from **``** into the sandbox.**
- **Installs **[**vim-plug**](https://github.com/junegunn/vim-plug)** if missing.**
- **Runs **``** and bulk installs all plugins.**
- **Runs **``** to fetch all specified CoC extensions.**
- **Never touches your real home directory or dotfiles.**

---

## Adding or Updating Plugins & Extensions

- Edit `configs/.vimrc` to add, remove, or pin vim plugins.
- Edit `vide-bootstrap.sh` to update the `COCP` array for CoC extensions.
- Place any new config files in `configs/` as needed.

---

## FAQ

**Q: Can I use this to overwrite my real Vim setup?**\
A: Yes, but that's your funeral. By default, VIDE is safe and sandboxed.

**Q: How do I update plugins/extensions?**\
A: Edit configs, then rerun the script with a clean sandbox.

**Q: Does this handle plugin version pinning?**\
A: Not yet—pin in `.vimrc` if you care. See script and comments for details.

**Q: Where are my settings?**\
A: All configs are in the `configs/` directory.

---

## TODO / Future Features

-

---

## License

MIT (or your preferred license here)

---

**Go wild, break nothing, and get back to editing.**

