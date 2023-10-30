### VIM

`leader = ,`

## Commands

| Shortcut            |           Description            |
| ------------------- | :------------------------------: |
| `<F3>`              |            Paste Mode            |
| `<Leader>f`         |           Format Selected        |
| `<leader>b`         |           History back           |
| `<leader>tf`        |      Run current file test       |
| `<leader>tl`        |          Run last test           |
| `<ctrl>b`           |          Open nerd-tree          |
| `<leader><leader>w` |     Navigate in current file     |
| `<leader>fw`        |   Find by current cursor word    |
| `<space>gd`         |             Git diff             |
| `<space>gb`         |            Git blame             |
| `<space>gs`         |            Git status            |
| `<ctrl>p`           |            Find file             |
| `gd`                |         Go to definition         |
| `gs`                |     Go to definition: Split      |
| `gv`                | Go to definition: Vertical Split |
| `<leader>c<space>`  | Toggles the comment state of the selected line(s) |
|` <leader>cm`        | Comments the given lines using only one set of multipart delimiters. |
|`<leader>cy`         | Same as cc except that the commented line(s) are yanked first. |

## Dependencies

Install extensions [COC](https://github.com/neoclide/coc.nvim)

| Install command            |                          Link                          |
| -------------------------- | :----------------------------------------------------: |
| `:CocInstall coc-elixir`   | [repository](https://github.com/elixir-lsp/coc-elixir) |
| `:CocInstall coc-emmet`    |  [repository](https://github.com/neoclide/coc-emmet)   |
| `:CocInstall coc-eslint`   |  [repository](https://github.com/neoclide/coc-eslint)  |
| `:CocInstall coc-git`      |   [repository](https://github.com/neoclide/coc-git)    |
| `:CocInstall coc-pairs`    |  [repository](https://github.com/neoclide/coc-pairs)   |
| `:CocInstall coc-prettier` | [repository](https://github.com/neoclide/coc-prettier) |
| `:CocInstall coc-snippets` | [repository](https://github.com/neoclide/coc-snippets) |
| `:CocInstall coc-tsserver` | [repository](https://github.com/neoclide/coc-tsserver) |
| `:CocInstall coc-pairs`    | [repository](https://github.com/neoclide/coc-pairs)    |

### Prettier setup
Inside `:CocConfig` add the config bellow
```json
{
  "coc.preferences.formatOnSaveFiletypes": ["javascript", "typescript", "typescriptreact", "typescript.tsx"]
}
```
**typescriptreact**: For ReactJS projects
