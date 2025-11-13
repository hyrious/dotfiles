eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"

# Rust
export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
export RUSTC_WRAPPER="sccache"

# Edit
export PATH="$HOME/.local/bin:$PATH"

# Ruby
export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# Node.js
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"

# Electron
export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
# export ELECTRON_SKIP_BINARY_DOWNLOAD=1

export COREPACK_NPM_REGISTRY="https://registry.npmmirror.com"
export COREPACK_ENABLE_AUTO_PIN=0
export COREPACK_INTEGRITY_KEYS=0

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
