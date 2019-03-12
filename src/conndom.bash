#!/bin/bash
#########################################
# Name     : CONNDOM                    #
# Function : cURL Helper                #
# Version  : 1.0                        #
# Coded    : Schopath [www.zerobyte.id] #
#########################################

function proxyCreate() {
	wget -q https://free-proxy-list.net/ -O /tmp/proxylists.txt.download
	cat /tmp/proxylists.txt.download | sed 's/<\/thead><tbody>/\n\n\n/g' | sed 's/<tr><td>/\n/g' | sed 's/<th>/\n/g' | grep ' ago' | sed 's/<\/td><td>/ /g' | awk '{print $1":"$2}' > /tmp/proxylists.txt.tmp
	if [[ -f /tmp/proxylists.txt ]]
	then
		cat /tmp/proxylists.txt >> /tmp/proxylists.txt.tmp
	fi
	IFS=$'\n'
	for GTPROX in $(curl -s "http://www.gatherproxy.com/" | grep PROXY_IP)
	do
		IP_PROX=$(echo $GTPROX | grep -Po 'PROXY_IP":"\K.*?(?=")')
		PORT_PROXT=$(echo $GTPROX | grep -Po 'PROXY_PORT":"\K.*?(?=")')
		PORT_PROX=$(echo $((0x${PORT_PROXT})))
		echo "${IP_PROX}:${PORT_PROX}" >> /tmp/proxylists.txt.tmp
	done
	for PROXY in $(cat /tmp/proxylists.txt.tmp)
	do
		PROXCON=$(curl --proxy $PROXY --connect-timeout 2 --max-time 2 -sl "https://raw.githubusercontent.com/panophan/Conndom/master/testconnection" 2> /dev/null)
		if [[ $PROXCON =~ "CONNECTION_CHECK_1998" ]]
		then
			echo "[OK!] ${PROXY}"
			echo "${PROXY}" >> /tmp/proxylists.txt.live
		else
			echo "[BAD] ${PROXY}"
		fi
	done
	cat /tmp/proxylists.txt.live > /tmp/proxylists.txt
	rm /tmp/proxylists.txt.*
}

function proxyRand() {
	if [[ ! -f /tmp/proxylists.txt ]];
	then
		echo "ERROR: Proxy not found, please create it!"
		exit
	else
		if [[ $(expr `date +%s` - `date -r /tmp/proxylists.txt +%s`) -lt 3600 ]]
		then
			echo "$(head -$((${RANDOM} % `wc -l < /tmp/proxylists.txt` + 1)) /tmp/proxylists.txt | tail -1)"
		else
			echo "ERROR: Existing proxy has been 1 hour, please re-create it!"
			exit
		fi
	fi
}

function randomUA() {
	echo 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36' > /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.83 Safari/537.1' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (X11; OpenBSD i386) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 4.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2226.0 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/534.30 (KHTML, like Gecko) Ubuntu/11.04 Chromium/12.0.742.112 Chrome/12.0.742.112 Safari/534.30' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (X11; Linux i586; rv:31.0) Gecko/20100101 Firefox/31.0' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.4) Gecko/20100625 Gentoo Firefox/3.6.4' >> /tmp/useragents.txt
	echo 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36' >> /tmp/useragents.txt
	echo "$(head -$((${RANDOM} % `wc -l < /tmp/useragents.txt` + 1)) /tmp/useragents.txt | tail -1)"
	rm /tmp/useragents.txt
}

if [[ ${1} == "--help" ]] || [[ -z ${1} ]]
then
	echo " # CONNDOM 1.0 --"
	echo "   Connection Random - Helper tool"
	echo ""
	echo " # Usage : "
	echo " --proxy-create  - Create or renew proxy lists"
	echo " --proxy-rand    - Get a random proxy"
	echo " --proxy-lists   - Show all proxy lists"
	echo " --ua-rand       - Get a random user-agent"
elif [[ ${1} == "--proxy-create" ]]
then
	proxyCreate
elif [[ ${1} == "--proxy-rand" ]]
then
	proxyRand
elif [[ ${1} == "--proxy-lists" ]]
then
	if [[ ! -f /tmp/proxylists.txt ]];
	then
		echo "ERROR: Proxy not found, please create it!"
		exit
	fi
	if [[ $(expr `date +%s` - `date -r /tmp/proxylists.txt +%s`) -gt 3600 ]]
	then
		echo "ERROR: Existing proxy has been 1 hour, please re-create it!"
		exit
	fi
	cat /tmp/proxylists.txt
elif [[ ${1} == "--ua-rand" ]]
then
	randomUA
fi
