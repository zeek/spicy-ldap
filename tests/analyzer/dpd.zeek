# Copyright (c) 2021 by the Zeek Project. See LICENSE for details.

# @TEST-EXEC: zeek -C -r ${TRACES}/ldap-simpleauth-no-standard-port.pcap %INPUT
# @TEST-EXEC: btest-diff conn.log
# @TEST-EXEC: btest-diff ldap.log
# @TEST-EXEC: btest-diff ldap_search.log
#
# @TEST-DOC: Test LDAP analyzer DPD with small trace on a non-standard port.

@load analyzer
