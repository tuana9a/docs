import sys
# pip install srvlookup
import srvlookup 
# pip install dnspython
import dns.resolver  


host = "rs0.bizflycloud.tuana9a.tech"

if len(sys.argv) > 1:
    host = sys.argv[1]

if host:
    services = srvlookup.lookup("mongodb", domain=host)
    for entry in services:
        print("%s:%i" % (entry.hostname, entry.port), end="")
        for ip in dns.resolver.resolve(entry.hostname, 'A'):
            print(' ', ip.to_text())
else:
    print("No host specified")
