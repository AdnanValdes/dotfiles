function fish_greeting
	date
    set dailies "$HOME/vault/fleeting"
    set yesterday (date  --date="yesterday" +"%Y-%m-%d")
	command sed 1,5d "$dailies/$yesterday.md"
end
