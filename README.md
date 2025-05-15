# momentum.nvim

> Smart key acceleration for motion in Neovim.

`momentum.nvim` enhances your navigation by detecting rapid key repetition and triggering smarter movements. For example, pressing `h` quickly 5 times will move to the **previous word**, instead of just moving left character by character.

---

## ✨ Features

- 🔁 Detects fast repeated key presses (e.g. `h`, `l`, `j`, `k`).
- 🚀 Triggers **custom motions** when a threshold is reached.
- ⚙️ Fully **configurable** via `setup()`:
  - Change delay (`threshold`)
  - Define how many repeats to trigger (`trigger_count`)
  - Customize which keys trigger which motions (`mappings`)
- 🧠 Smart defaults: `h` → `b`, `l` → `w`
- 🧵 Lightweight, zero dependencies, written in pure Lua

---

## ⚙️ Configuration

You can pass options to setup() to customize the plugin’s behavior:

```lua
require("momentum").setup({
  threshold = 0.4,       -- Maximum time (in seconds) between key presses to count as a sequence
  trigger_count = 5,     -- How many repeated presses trigger the replacement
  mappings = {
    h = "b",             -- After 5 rapid 'h', perform 'b' (move back by word)
    l = "w",             -- After 5 rapid 'l', perform 'w' (move forward by word)
  },
})
```

## 📦 Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "gustavosbarreto/momentum.nvim",
}
```
