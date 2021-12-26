function vpn
	if  command sudo surfshark-vpn status | grep "Not connected"
		command sudo surfshark-vpn attack
	else
		echo "Connection found. Closing VPN"
		command sudo surfshark-vpn down
	end
end
