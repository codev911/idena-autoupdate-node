#!/bin/bash
while true
do
	if [ ! -f "tmpver.txt" ]; then
		echo "tmpver.txt does not exist, creating.."
		touch tmpver.txt
	fi
	check_ver () {
		local ver_result=$(curl --silent "https://api.github.com/repos/idena-network/idena-go/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
		echo "$ver_result"
	}

	ver_result="$(check_ver)"
	ver_now=$(cat "tmpver.txt")
	ver_url=${ver_result//v}

	if [ "$ver_result" == "$ver_now" ]; then
		echo "updated, recheck again every 10 Minutes"
		sleep 600
	else
		echo "${ver_result} detected, updating..."
		screen -XS idenanode quit
		rm tmpver.txt
		curl --silent "https://api.github.com/repos/idena-network/idena-go/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' > tmpver.txt
		rm idena-node
		wget https://github.com/idena-network/idena-go/releases/download/$ver_result/idena-node-linux-$ver_url
		mv idena-node-linux-$ver_url idena-node 
		chmod +x idena-node
		echo "Running new node..."
		screen -d -m -S idenanode ./idena-node --config=config.json
		echo "done, recheck again every 10 seconds"
		sleep 10
	fi
done
