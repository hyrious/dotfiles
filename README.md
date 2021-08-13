## Dotfiles

I'd like to apply these config by hand instead of automata, so keep reading...

### .gitconfig

```ini
[http]
    postBuffer = 524288000
[core]
    editor = subl -w
[alias]
    please = push --force-with-lease
    commend = commit --amend --no-edit
    it = !git init && git commit -m "root" --allow-empty
    st = status --short --branch
    l = !git log --graph --abbrev-commit --decorate --all --format=format:"\"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)\""
[commit]
    gpgsign = true
[init]
    defaultBranch = main
[http "https://github.com"]
    proxy = socks5h://localhost:1080
```

### .vscode/settings.json

```json
{
  "editor.tabSize": 2,
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.addMissingImports": true
  },
  "prettier.tabWidth": 2,
  "prettier.endOfLine": "auto",
  "prettier.arrowParens": "avoid",
  "prettier.printWidth": 100
}
```

### tsconfig.json

```javascript
{
  "include": ["src"],
  "compilerOptions": {
    "strict": true,
    "noFallthroughCasesInSwitch": true,
    "noPropertyAccessFromIndexSignature": true,
    "noImplicitOverride": true,
    "forceConsistentCasingInFileNames": true,
    "exactOptionalPropertyTypes": true,
    "noEmit": true,
    // "declaration": true,
    // "emitDeclarationOnly": true,
    "skipLibCheck": true,
    "moduleResolution": "Node",
    "resolveJsonModule": true,
    "esModuleInterop": true,
    "lib": ["ESNext"],
    "target": "ESNext",
    "module": "ESNext"
  }
}
```

### License

CC0.
