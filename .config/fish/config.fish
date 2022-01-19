if status is-interactive
    # Commands to run in interactive sessions can go here
    set --export PATH $HOME/.cargo/bin $PATH
end


function fish_greeting
    date
    set dailies "$HOME/vault/fleeting"
    set yesterday (date  --date="yesterday" +"%Y-%m-%d")
	command sed 1,5d "$dailies/$yesterday.md"
end


function vpn
    if  ! ip link | grep -q tun0
        command  curl -ks https://www.dnsleaktest.com | grep hello |sed -e 's/<[^>]*>//g' -e 's/Hello/On DNSLeakTest, your IP is:/g' -e 's/^[ \t]*//;s/[ \t]*$//'
        echo "No VPN found; starting Surfshark..."
        command sudo surfshark-vpn attack
        command  curl -ks https://www.dnsleaktest.com | grep hello |sed -e 's/<[^>]*>//g' -e 's/Hello/On DNSLeakTest, your IP is:/g' -e 's/^[ \t]*//;s/[ \t]*$//'
    else
        echo "Connection found. Closing VPN"
        command sudo surfshark-vpn down
        command  curl -ks https://www.dnsleaktest.com | grep hello |sed -e 's/<[^>]*>//g' -e 's/Hello/On DNSLeakTest, your IP is:/g' -e 's/^[ \t]*//;s/[ \t]*$//'
    end
end



alias ls "exa"
alias ssh "kitty +kitten ssh"
alias vault "nvim $HOME/vault"
alias yeet "yay -Rcns"
alias tree "exa -T"
