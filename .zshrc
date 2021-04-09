export VISUAL='/opt/homebrew/bin/nvim'
export EDITOR="$VISUAL"
export PATH=/usr/local/bin:/opt/homebrew/bin:$PATH
export PATH=$PATH:~/.dot/scripts
export PATH="$PATH:/Users/kybar/Library/Application Support/Coursier/bin"
alias datef='date +"%Y-%m-%d"'
alias pants='~/workspace/source/pants'
bindkey -e

kmapcap() {
  hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x700000043},{"HIDKeyboardModifierMappingSrc":0x700000043,"HIDKeyboardModifierMappingDst":0x700000039}]}'
}

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
