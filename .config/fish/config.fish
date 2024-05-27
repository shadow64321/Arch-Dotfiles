if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
    alias music='musikcube'
    alias fishy='asciiquarium'
    alias rfishy='asciiquarium | lolcat'
    alias sysinf='btop'
    alias ascii='ascii-image-converter'
    alias update='sudo nixos-rebuild switch'
    alias sysedit='sudo vim /etc/nixos/configuration.nix'
    alias anime='bash ~/Documents/ani-cli/ani-cli'
    alias drama='bash ~/Documents/dra-cla/dra-cla'
    alias sysview='bat /etc/nixos/configuration.nix'
    alias syspacks='bat /etc/current-system-packages'
    alias rename='mv'
    alias rebsp='bash ~/.config/bspwm/bspwmrc'
    alias binds='bat ~/.config/sxhkd/sxhkdrc'
    # neofetch
    alias img='feh'
    cowsay "Life is like a weiner, sometimes it gets hard for no reason" | lolcat
end
