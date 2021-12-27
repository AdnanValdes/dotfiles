function vpn
	if  ! ifconfig | grep -q tun0
        echo "No VPN found; starting Surfshark..."
		command sudo surfshark-vpn attack
        command  curl -ks https://www.dnsleaktest.com | grep hello | sed -e 's/<[^>]*>//g' -e 's/Hello/On DNSLeakTest, your IP is:/g' -e 's/^[ \t]*//;s/[ \t]*$//'
	else
		echo "Connection found. Closing VPN"
		command sudo surfshark-vpn down
	end
end
