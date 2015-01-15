# Prints the local network IPv4 address for a statically defined NIC or search for an IPv4 address on all active NICs.
current_lan_ip() {
  while read -r nic; do
    ipv4s_on_nic=$(ifconfig ${nic} 2>/dev/null | awk '$1 == "inet" { print $2 }')
    for lan_ip in ${ipv4s_on_nic[@]}; do
      [[ -n "${lan_ip}" ]] && break
    done
    [[ -n "${lan_ip}" ]] && break
  done < <(ifconfig 2>/dev/null | awk -F':' '/^[a-z]/ && !/^lo/ { print $1 }')

  echo "${lan_ip-N/A}"
  return 0
}
