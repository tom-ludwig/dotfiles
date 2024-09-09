# Dotfiles

## Requirements

- Git
- GNU stow

## Installation

Checkout out the repositiory in your `$HOME` directory.

```
$ git clone https://github.com/activcoding/dotfiles.git
$ cd dotfiles
```

Then use GNU stow to create symlinks.

```
$ stow .
```

## Customs

### ZSH

#### Aliases

Aliases are defined in /aliases/aliases

##### Git

- gs: `git status`
- ga: `git add`
- gp: `git push`
- gpo: `git push origin`
- gtd: `git tag --delete`
- gtdr: `git tag --delete origin`
- gr: `git branch -r`
- gplo: `git pull origin`
- gb: `git branch `
- gc: `git commit`
- gd: `git diff`
- gco: `git checkout `
- gl: `git log`
- gr: `git remote`
- grs: `git remote show`
- glo: `git log --pretty="oneline"`
- glol: `git log --graph --online --decorate`

## TODOs

- `nvim-treesittter/nvim-treesittter-textobjects`
- `lualine`: Fix seccond neovim line showing
- `substitue` `surround`
- `folke/todo-comments.nvim`
- `Diffview.nvim`
