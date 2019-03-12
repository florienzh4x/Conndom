#!/bin/bash
#########################################
# Name     : CONNDOM                    #
# Function : cURL Helper                #
# Version  : 1.0                        #
# Coded    : Schopath [www.zerobyte.id] #
#########################################

function conndom() {
	if [[ $1 == "USER_AGENT" ]];
	then
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
	elif [[ $1 == "PROXY" ]];
	then
		if [[ ! -f /tmp/proxylists.txt ]];
		then
			wget -q https://free-proxy-list.net/ -O /tmp/proxylists.trash
			cat proxylists.trash | sed 's/<\/thead><tbody>/\n\n\n/g' | sed 's/<tr><td>/\n/g' | sed 's/<th>/\n/g' | grep ' ago' | sed 's/<\/td><td>/ /g' | awk '{print $1":"$2}' >> /tmp/proxylist.tmp
			rm /tmp/proxylists.trash
			wget -q https://www.us-proxy.org/ -O /tmp/proxylists.trash
			cat proxylists.trash | sed 's/<\/thead><tbody>/\n\n\n/g' | sed 's/<tr><td>/\n/g' | sed 's/<th>/\n/g' | grep ' ago' | sed 's/<\/td><td>/ /g' | awk '{print $1":"$2}' >> /tmp/proxylist.tmp
			cat /tmp/proxylist.tmp | sort -nr | uniq > /tmp/proxylists.txt
			rm /tmp/proxylist.tmp
			rm /tmp/proxylists.trash
			echo "$(head -$((${RANDOM} % `wc -l < /tmp/proxylists.txt` + 1)) /tmp/proxylists.txt | tail -1)"
		else
			if [[ $(expr `date +%s` - `date -r /tmp/proxylists.txt +%s`) -lt 600 ]]
			then
				echo "$(head -$((${RANDOM} % `wc -l < /tmp/proxylists.txt` + 1)) /tmp/proxylists.txt | tail -1)"
			else
				rm /tmp/proxylists.txt
				wget -q https://free-proxy-list.net/ -O /tmp/proxylists.trash
				cat proxylists.trash | sed 's/<\/thead><tbody>/\n\n\n/g' | sed 's/<tr><td>/\n/g' | sed 's/<th>/\n/g' | grep ' ago' | sed 's/<\/td><td>/ /g' | awk '{print $1":"$2}' >> /tmp/proxylist.tmp
				rm /tmp/proxylists.trash
				wget -q https://www.us-proxy.org/ -O /tmp/proxylists.trash
				cat proxylists.trash | sed 's/<\/thead><tbody>/\n\n\n/g' | sed 's/<tr><td>/\n/g' | sed 's/<th>/\n/g' | grep ' ago' | sed 's/<\/td><td>/ /g' | awk '{print $1":"$2}' >> /tmp/proxylist.tmp
				cat /tmp/proxylist.tmp | sort -nr | uniq > /tmp/proxylists.txt
				rm /tmp/proxylist.tmp
				rm /tmp/proxylists.trash
				echo "$(head -$((${RANDOM} % `wc -l < /tmp/proxylists.txt` + 1)) /tmp/proxylists.txt | tail -1)"
			fi
		fi
	else
		echo "ERROR: Please input correctly!"
		echo "HINT: conndom --help"
	fi
}

if [[ ${1} == "--help" ]] || [[ -z ${1} ]];
then
	echo ""
	echo " ----- conndom 1.0 ----"
	echo "   Connection Random Helper"
	echo "   by ZeroByte.ID"
	echo " ----------------------"
	echo ""
	echo " -------- HELP --------"
	echo " 1. PROXY      - Generate free proxy randomly"
	echo " 2. USER_AGENT - Generate valid user agent randomly"
	echo " ----------------------"
	echo ""
	echo " EXAMPLE: conndom USER_AGENT"
	echo ""
	exit
fi

conndom ${1}
