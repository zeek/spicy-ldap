signature dpd_ldap_client_udp {
  ip-proto == udp
  src-port != 161
  dst-port != 161
  payload /^\x30.\x02\x01/
}

signature dpd_ldap_server_udp {
  ip-proto == udp
  src-port != 161
  dst-port != 161
  payload /^\x30/
  requires-reverse-signature dpd_ldap_client_udp
  enable "spicy_LDAP_UDP"
}

signature dpd_ldap_client_tcp {
  ip-proto == tcp
  payload /^\x30.\x02\x01/
}

signature dpd_ldap_server_tcp {
  ip-proto == tcp
  payload /^\x30/
  requires-reverse-signature dpd_ldap_client_tcp
  enable "spicy_LDAP_TCP"
}
