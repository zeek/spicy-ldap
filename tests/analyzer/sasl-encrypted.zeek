# Copyright (c) 2021 by the Zeek Project. See LICENSE for details.

# Note: the test trace is derived from https://wiki.wireshark.org/uploads/__moin_import__/attachments/SampleCaptures/ldap-krb5-sign-seal-01.cap:
#  - The LDAP flow selected (filtered out the Kerberos packets)
#  - Truncated to 10 packets (where packet 10 contains the SASL encrypted LDAP message)
#  - One \x30 byte in the cyphertext changed to \x00

# @TEST-EXEC: zeek -C -r ${TRACES}/ldap-krb5-sign-seal-01.pcap %INPUT
# @TEST-EXEC: btest-diff conn.log
# @TEST-EXEC: btest-diff ldap.log
# @TEST-EXEC: btest-diff ldap_search.log
# @TEST-EXEC: ! test -f weird.log
# @TEST-EXEC: ! test -f dpd.log
#
# @TEST-DOC: Test LDAP analyzer with SASL encrypted payloads.

@load analyzer
