#!/usr/bin/bash

domain="${1?Need to enter domain}"
reconType="${2?Need ReconType to run all modules of that type e.g domain|domains, host|hosts, location|locations, profile|profiles, companies, credentials, netblock, ports, repostitories, contacts}"
sleeptime=4

declare -a companies_modules=(
    "recon/companies-contacts/bing_linkedin_cache"
    "recon/companies-contacts/jigsaw/point_usage"
    "recon/companies-contacts/jigsaw/purchase_contact"
    "recon/companies-contacts/jigsaw/search_contacts"
    "recon/companies-multi/github_miner"
    "recon/companies-multi/whois_miner"
    )

declare -a contacts_modules=(
	"recon/contacts-contacts/mailtester"
    "recon/contacts-contacts/mangle"
    "recon/contacts-contacts/unmangle"
    "recon/contacts-credentials/hibp_breach"
    "recon/contacts-credentials/hibp_paste"
    "recon/contacts-domains/migrate_contacts"
    "recon/contacts-profiles/fullcontact"
    )

declare -a credentials_modules=(    
    "recon/credentials-credentials/adobe"
    "recon/credentials-credentials/bozocrack"
    "recon/credentials-credentials/hashes_org"
    )

declare -a domains_modules=(
    "recon/domains-contacts/metacrawler"
    "recon/domains-contacts/pgp_search"
    "recon/domains-contacts/whois_pocs"
    "recon/domains-credentials/pwnedlist/account_creds"
    "recon/domains-credentials/pwnedlist/api_usage"
    "recon/domains-credentials/pwnedlist/domain_creds"
    "recon/domains-credentials/pwnedlist/domain_ispwned"
    "recon/domains-credentials/pwnedlist/leak_lookup"
    "recon/domains-credentials/pwnedlist/leaks_dump"
    "recon/domains-domains/brute_suffix"
    "recon/domains-hosts/bing_domain_api"
    "recon/domains-hosts/bing_domain_web"
    "recon/domains-hosts/brute_hosts"
    "recon/domains-hosts/builtwith"
    "recon/domains-hosts/certificate_transparency"
    "recon/domains-hosts/google_site_web"
    "recon/domains-hosts/hackertarget"
    "recon/domains-hosts/mx_spf_ip"
    "recon/domains-hosts/netcraft"
    "recon/domains-hosts/shodan_hostname"
    "recon/domains-hosts/ssl_san"
    "recon/domains-hosts/threatcrowd"
    "recon/domains-vulnerabilities/ghdb"
    "recon/domains-vulnerabilities/punkspider"
    "recon/domains-vulnerabilities/xssed"
    "recon/domains-vulnerabilities/xssposed"
    )

declare -a hosts_modules=(
    "recon/hosts-domains/migrate_hosts"
    "recon/hosts-hosts/bing_ip"
    "recon/hosts-hosts/ipinfodb"
    "recon/hosts-hosts/ipstack"
    "recon/hosts-hosts/resolve"
    "recon/hosts-hosts/reverse_resolve"
    "recon/hosts-hosts/ssltools"
    "recon/hosts-hosts/virustotal"
    "recon/hosts-locations/migrate_hosts"
    "recon/hosts-ports/shodan_ip"
    )

declare -a locations_modules=(
    "recon/locations-locations/geocode"
    "recon/locations-locations/reverse_geocode"
    "recon/locations-pushpins/flickr"
    "recon/locations-pushpins/picasa"
    "recon/locations-pushpins/shodan"
    "recon/locations-pushpins/twitter"
    "recon/locations-pushpins/youtube"
	)

declare -a netblocks_modules=(   
    "recon/netblocks-companies/whois_orgs"
    "recon/netblocks-hosts/reverse_resolve"
    "recon/netblocks-hosts/shodan_net"
    "recon/netblocks-hosts/virustotal"
    "recon/netblocks-ports/census_2012"-
    "recon/netblocks-ports/censysio"
	)

declare -a ports_modules=(
    "recon/ports-hosts/migrate_ports"
	)

declare -a profiles_modules=(
    "recon/profiles-contacts/dev_diver"
    "recon/profiles-contacts/github_users"
    "recon/profiles-profiles/namechk"
    "recon/profiles-profiles/profiler"
    "recon/profiles-profiles/twitter_mentioned"
    "recon/profiles-profiles/twitter_mentions"
    "recon/profiles-repositories/github_repos"
	)

declare -a repostories_modules=(
	"recon/repositories-profiles/github_commits"
    "recon/repositories-vulnerabilities/gists_search"
    "recon/repositories-vulnerabilities/github_dorks"
    )


declare -a all_modules=("${domains_modules[@]}" "${hosts_modules[@]}" "${contacts_modules[@]}" "${companies_modules[@]}" "${repositories_modules[@]}" "${profiles_modules[@]}" "${credentials_modules[@]}" "${netblocks_modules[@]}" "${locations_modules[@]}" "${ports_modules[@]}")

recon_filepath="/tmp/$domain"

if [[ -f "$recon_filepath".resource ]]; then
 	#statements
 	rm -fv "$recon_filepath.resource"
 	echo "Existing file $recon_filepath.resource deleted"
 fi 

touch "$recon_filepath".resource
echo ""
echo "File $recon_filepath.resource created"
echo ""

echo "workspaces select $domain" >> "$recon_filepath".resource
echo "add domains $domain" >> "$recon_filepath".resource

case $reconType in 
	"host" | "hosts")
		for mod in "${hosts_modules[@]}"; do
			#statements
			echo ""
			echo "use $mod" >> "$recon_filepath".resource
			#echo "set SOURCE $domain" >> "$recon_filepath".resource
			echo "run" >> "$recon_filepath".resource
			echo "sleep $sleeptime" >> "$recon_filepath".resource
			echo ""
		done
	;;

	"domain" | "domains")
		for mod in "${domains_modules[@]}"; do
			#statements
			echo ""
			echo "use $mod" >> "$recon_filepath".resource
			echo "set SOURCE $domain" >> "$recon_filepath".resource
			echo "run" >> "$recon_filepath".resource
			echo "sleep $sleeptime" >> "$recon_filepath".resource
			echo ""
		done
	;;

	"companies")
		for mod in "${companies_modules[@]}"; do
			#statements
			echo ""
			echo "use $mod" >> "$recon_filepath".resource
			#echo "set SOURCE $domain" >> "$recon_filepath".resource
			echo "run" >> "$recon_filepath".resource
			echo "sleep $sleeptime" >> "$recon_filepath".resource
			echo ""
		done
	;;

	"credentials")
		for mod in "${credentials_modules[@]}"; do
			#statements
			echo ""
			echo "use $mod" >> "$recon_filepath".resource
			#echo "set SOURCE $domain" >> "$recon_filepath".resource
			echo "run" >> "$recon_filepath".resource
			echo "sleep $sleeptime" >> "$recon_filepath".resource
			echo ""
		done
	;;

	"location" | "locations")
		for mod in "${locations_modules[@]}"; do
			#statements
			echo ""
			echo "use $mod" >> "$recon_filepath".resource
			#echo "set SOURCE $domain" >> "$recon_filepath".resource
			echo "run" >> "$recon_filepath".resource
			echo "sleep $sleeptime" >> "$recon_filepath".resource
			echo ""
		done
	;;

	"netblocks")
		for mod in "${netblocks_modules[@]}"; do
			#statements
			echo ""
			echo "use $mod" >> "$recon_filepath".resource
			#echo "set SOURCE $domain" >> "$recon_filepath".resource
			echo "run" >> "$recon_filepath".resource
			echo "sleep $sleeptime" >> "$recon_filepath".resource
			echo ""
		done
	;;

	"profile" | "profiles")
		for mod in "${profiles_modules[@]}"; do
			#statements
			echo ""
			echo "use $mod" >> "$recon_filepath".resource
			#echo "set SOURCE $domain" >> "$recon_filepath".resource
			echo "run" >> "$recon_filepath".resource
			echo "sleep $sleeptime" >> "$recon_filepath".resource
			echo ""
		done
	;;

	"ports")
		for mod in "${ports_modules[@]}"; do
			#statements
			echo ""
			echo "use $mod" >> "$recon_filepath".resource
			#echo "set SOURCE $domain" >> "$recon_filepath".resource
			echo "run" >> "$recon_filepath".resource
			echo "sleep $sleeptime" >> "$recon_filepath".resource
			echo ""
		done
	;;

	"repositories")
		for mod in "${repositories_modules[@]}"; do
			#statements
			echo ""
			echo "use $mod" >> "$recon_filepath".resource
			#echo "set SOURCE $domain" >> "$recon_filepath".resource
			echo "run" >> "$recon_filepath".resource
			echo "sleep $sleeptime" >> "$recon_filepath".resource
			echo ""
		done
	;;

	"contacts")
		for mod in "${contacts_modules[@]}"; do
			#statements
			echo ""
			echo "use $mod" >> "$recon_filepath".resource
			#echo "set SOURCE $domain" >> "$recon_filepath".resource
			echo "run" >> "$recon_filepath".resource
			echo "sleep $sleeptime" >> "$recon_filepath".resource
			echo ""
		done
	;;

	"all")
		for mod in "${all_modules[@]}"; do
			#statements
			echo ""
			echo "use $mod" >> "$recon_filepath".resource
			if [[ $mod == *"recon/domains"* ]]; then
			    #statments
			    echo "set SOURCE $domain" >> "$recon_filepath".resource
			fi
			# echo "set SOURCE $domain" >> "$recon_filepath".resource
			echo "run" >> "$recon_filepath".resource
			echo "sleep $sleeptime" >> "$recon_filepath".resource
			echo ""
		done
	;;
esac


echo "use reporting/html" >> "$recon_filepath".resource
echo "set CUSTOMER unknown" >> "$recon_filepath".resource
echo "set CREATOR unknown" >> "$recon_filepath".resource
echo "run" >> "$recon_filepath".resource

echo "use reporting/xml" >> "$recon_filepath".resource
echo "run" >> "$recon_filepath".resource

echo "use reporting/list" >> "$recon_filepath".resource
echo "run" >> "$recon_filepath".resource

echo "exit" >> "$recon_filepath".resource
sleep $sleeptime

cd /usr/share/recon-ng
./recon-ng --no-check -r "$recon_filepath".resource

echo ""
rm -fv "$recon_filepath".resource
echo "Resource file deleted"