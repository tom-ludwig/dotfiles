# Switches Kubernetes context using fzf for fuzzy searching.
function ksc --description 'Fuzzy search and switch Kubernetes context using fzf'
    set contexts (kubectl config get-contexts -o name | string split \n)
    set current_context (kubectl config current-context)

    set selected_context (
        printf "%s\n" $contexts | fzf \
            --prompt="Switch K8s Context > " \
            --height=50% \
            --reverse \
            --border=rounded \
            --color=fg:white,bg:235,hl:177,fg+:white,pointer:177,marker:177,prompt:111,spinner:111,header:111 \
            --header="Select Context (Current: $current_context)"
    )

    if test -n "$selected_context"
        echo "Switching to $selected_context..."
        kubectl config use-context "$selected_context"
    else
        echo "Context switch cancelled."
    end
end
