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

### License

CC0.
