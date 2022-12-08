## Dotfiles

<table><tr>
  <td><a href="./.gitconfig">.gitconfig</a></td>
  <td><a href="./.vscode/settings.json">.vscode/settings.json</a></td>
  <td><a href="./.prettierrc">.prettierrc</a></td>
  <td><a href="./tsconfig.json">tsconfig.json</a></td>
</tr></table>

<table><tr>
  <td><a href="./Preferences.sublime-settings">Preferences.sublime-settings</a></td>
  <td><a href="./Default (OSX).sublime-keymap">Default (OSX).sublime-keymap</a></td>
</tr></table>

### Case - use Prettier

**.vscode/settings.json**

```json
{
  "prettier.enable": true,
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",

  "svelte.enable-ts-plugin": true,
  "[svelte]": {
    "editor.defaultFormatter": "svelte.svelte-vscode"
  },

  "[vue]": {
    "editor.defaultFormatter": "Vue.volar"
  }
}
```

### License

CC0.
