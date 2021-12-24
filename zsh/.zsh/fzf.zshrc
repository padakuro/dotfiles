zstyle ":fzf-tab:*" fzf-flags --color=light
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' switch-group ',' '.'

# systemd unit status preview
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:journalctl:*' fzf-preview 'SYSTEMD_COLORS=1 journalctl --reverse --unit $word'