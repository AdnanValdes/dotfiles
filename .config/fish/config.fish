if status is-interactive
    # Commands to run in interactive sessions can go here
    set --export PATH $HOME/.cargo/bin $PATH
end


function fish_greeting
    date
    set dailies "$HOME/Archive/dailies"
    set yesterday (date  --date="yesterday" +"%Y-%m-%d")
	command sed 1,6d "$dailies/$yesterday.md"
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
alias vault "nvim $HOME/Archive/"
alias yeet "yay -Rcns"
alias update "yay -Syu"
alias tree "exa -T"
