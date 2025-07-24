# VIDE Keybindings & Custom Vim Cheat Sheet

This is a **summary of all the custom keystrokes, mappings, and commands from your VIDE Vim config**.\
It covers window navigation, editing tricks, IDE-like features, and plugin hotkeys.

---

## **Global Keybindings**

### **Window & Buffer Navigation**

| Key/Command                  | Action                                   |
| ---------------------------- | ---------------------------------------- |
| `<C-d>` (Ctrl+d)             | Close current window (`:q`)              |
| `<C-S-d>` (Ctrl+Shift+d)     | Close current window, force quit (`:q!`) |
| `<C-w>`                      | Switch to next window (custom mapped)    |
| `<C-S-w>`                    | Switch to previous window                |
| `<C-A-Left>` / `<C-A-Right>` | Move to left/right window                |
| `<C-A-Up>` / `<C-A-Down>`    | (if mapped) Move up/down window          |

### **Editing Shortcuts**

| Key/Command                  | Action                              |
| ---------------------------- | ----------------------------------- |
| `<C-S-Up>`                   | Move current line up                |
| `<C-S-Down>`                 | Move current line down              |
| `<C-S-Left>` / `<C-S-Right>` | Move by word left/right             |
| `<leader>ev`                 | Edit your .vimrc                    |
| `<leader>sv`                 | Source (reload) your .vimrc         |
| `<F5>`                       | Run your program (project-specific) |
| `<F6>`                       | Debug your program                  |

> **Note:** `<leader>` is typically the backslash `\`, unless you changed it.

### **IDE/Project Commands**

| Key/Command      | Action                               |
| ---------------- | ------------------------------------ |
| `:Git add %`     | Git add current file (custom)        |
| `:Gadd` or `:Ga` | Shortcut: git add current file       |
| `:Git commit`    | Git commit (will prompt for message) |
| `:Git ...`       | Run any git command in output pane   |
| `<leader>rn`     | CoC: Rename symbol                   |
| `<leader>f`      | CoC: Format file                     |
| `<leader>ac`     | CoC: Code action                     |

### **Visual & Insert Mode**

| Key/Command | Action                                     |
| ----------- | ------------------------------------------ |
| `<C-c>`     | Esc in insert/visual mode (quicker cancel) |
| `<C-v>`     | Visual block mode (default)                |

---

## **Plugin Highlights**

- **vim-plug:** Manage plugins with `:PlugInstall`, `:PlugUpdate`, etc.
- **CoC.nvim:** LSP/code-completion, language server features
  - `<Tab>`/`<S-Tab>` to select suggestions
  - `<leader>rn` to rename, `<leader>f` to format
- **UltiSnips:** Advanced code snippets
  - `<Tab>` to expand/next field in snippet
- **Rainbow parentheses:** Colorful bracket highlighting
- **ShowMarks:** Highlights marks visually

---

## **Useful Ex Commands**

- `:W` or `:Q` — Save or quit (upper-case aliases if mapped)
- `:Git ...` — Run git commands in output pane
- `:Gadd` / `:Ga` — Add current file to git
- `:Gcommit` — Commit (with message prompt)
- `:Run` — Run your project/program (custom output window)

---

## **Other Customizations**

- **Autosave on Run/Debug:** Running or debugging auto-saves buffers first.
- **Custom output window:** Runs, tests, and git commands appear in a dedicated split.
- **Python eval:** Can select lines and run Python, output in split.
- **Better search/replace:** Search highlights are easier to see.
- **Auto-detect file indentation:** DetectIndent plugin.

---

## **To Customize / Extend**

- All mappings are set in your `.vimrc` under sections labeled for navigation, IDE features, and plugin config.
- To remap any key, search `.vimrc` for `nnoremap` or `vnoremap` lines and update as needed.
- To add more plugins, edit the `plug#begin` ... `plug#end` block in `.vimrc`.

---

## **Legend**

- `<C-...>` = Hold **Control** and press key (e.g. `<C-d>` is Ctrl+d)
- `<S-...>` = Hold **Shift** and press key
- `<A-...>` = Hold **Alt**
- `<leader>` = Usually `\`, unless you remapped

#

## **Stationary Windows & Project Scripting**

VIDE features several **fixed-purpose windows**—think of them as “docks” inside your Vim workspace. Each has a dedicated key for toggling or opening:

### **Window Hotkeys**

| Key    | Window    | Purpose                                                                                                                          |
|--------|-----------|----------------------------------------------------------------------------------------------------------------------------------|
| `<F2>` | Output    | Shows the **compilation/run output**. Used by `<F5>` (Run) and `<F6>` (Debug). Output appears here, not in main editor windows.  |
| `<F3>` | Explorer  | Opens a **file explorer/project file list**. Lets you browse and open files via `<C-o>`. File list comes from `.vim-list.sh`.    |
| `<F4>` | Notes     | Opens a **notes window**—meant for jotting quick project notes. Content is auto-saved (see notes below).                         |

---

### **Integration with Project Scripts**

- **`.vim-run.sh`** — Used by `<F5>` (Run) for build/run commands per project.
- **`.vim-debug.sh`** — Used by `<F6>` (Debug) for debug commands per project.
- **`.vim-list.sh`** — Used by `<F3>` (Explorer) to provide the file list.

*All three should be edited per-project to match your build, debug, and navigation needs.*

---

### **Notes Window Details (`<F4>`)**

- The Notes window is for quick, project-specific notes or todos.
- Notes are saved automatically to a file (often `notes.txt` or `.vim-notes`—check your functions for the exact path).
- Use it as a persistent scratchpad—notes survive between sessions.

---

### **How This Works**

- **Stationary windows** are reserved for their special purpose and don’t close when you quit other windows.
- Always one keystroke away, never messes with your main edit windows.
- Designed to keep workflow smooth, fast, and organized.

---

### **Best Practices**

- **Edit `.vim-run.sh`, `.vim-debug.sh`, and `.vim-list.sh` per project** (commit them if you want reproducibility).
- Use the Notes window for project ideas, TODOs, or quick scratch work—you don’t need an external system.

---

### **Example Workflow**

1. **Write code** in your main window.
2. **Press `<F5>`** to run/compile—output appears in Output window (`<F2>`).
3. **Browse files** with `<F3>`—project file list, open with `<C-o>`.
4. **Take project notes** with `<F4>`—never lose ideas or TODOs.
5. **Edit `.vim-run.sh`, `.vim-debug.sh`, or `.vim-list.sh` as needed per project.

---

