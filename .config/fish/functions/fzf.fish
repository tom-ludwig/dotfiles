function fzf
    command fzf --height=40% --layout=reverse --border=rounded --margin=1 --padding=1 \
        --color=fg:#cdd6f4,bg:#1e1e2e,hl:#89b4fa \
        --color=fg+:#cdd6f4,bg+:#181825,hl+:#89b4fa \
        --color=info:#cba6f7,prompt:#a6e3a1,pointer:#89b4fa,marker:#f5c2e7,spinner:#a6e3a1 \
        $argv
end
