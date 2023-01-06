# Copyright (c) 2021 by the Zeek Project. See LICENSE for details.

# @TEST-EXEC: zeek -C -r ${TRACES}/ldap-simpleauth.pcap %INPUT >output 2>&1
# @TEST-EXEC: btest-diff output
# @TEST-EXEC: btest-diff conn.log
# @TEST-EXEC: ! test -f ldap.log
# @TEST-EXEC: ! test -f ldap_search.log
#
# @TEST-DOC: Test LDAP analyzer with small trace using logging policies.

@load analyzer

hook LDAP::log_policy(rec: LDAP::Message, id: Log::ID, filter: Log::Filter)
    {
    break;
    }

hook LDAP::log_policy_search(rec: LDAP::Search, id: Log::ID, filter: Log::Filter)
    {
    break;
    }
