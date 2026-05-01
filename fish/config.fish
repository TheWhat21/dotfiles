source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch

function fish_greeting
    if test (tput cols) -lt 139
        fastfetch --config ~/.config/fastfetch/small_config.jsonc
    else
        fastfetch --config ~/.config/fastfetch/large_config.jsonc
    end
end

starship init fish | source

fish_add_path /home/username/.spicetify
