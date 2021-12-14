# note ==========================================================================
mongo --quiet --eval "db.adminCommand( { getLog:'global'} ).log.forEach(x => {print(x)})" | grep REPL
rs.printSlaveReplicationInfo()

# user ==========================================================================
use admin
db.createUser(
   {
      user: "admin",
      pwd: "password",
      roles: [ 
         { role: "userAdminAnyDatabase", db: "admin" }, 
         { role: "clusterAdmin", db: "admin" },
         { role: "backup", db: "admin" },
         "readWriteAnyDatabase",
      ],
      mechanisms:[  
         "SCRAM-SHA-1"
      ]
   }
)

use admin
db.grantRolesToUser(
    "admin",
    [
      { role: "backup", db: "admin" },
      { role: "clusterAdmin", db: "admin" }
    ]
)

# initiate ======================================================================
rs.initiate({
   _id : "rs0",
   members: [
      { _id: 0, host: "vm-01.local:27017", priority: 3 },
      { _id: 1, host: "vm-02.local:27017", priority: 2 },
      { _id: 2, host: "vm-03.local:27017", priority: 1 },
   ]
})

rs.initiate({
   _id : "rs0",
   members: [
      { _id: 0, host: "vm-01.local:27017", priority: 2 },
      { _id: 1, host: "vm-02.local:27017", priority: 0 },
      { _id: 2, host: "vm-03.local:27017", arbiterOnly: true },
      { _id: 3, host: "vm-04.local:27017", priority:0, hidden: true },
      { _id: 4, host: "vm-05.local:27017", priority:0, slaveDelay: 1800 },
      { _id: 5, host: "vm-06.local:27017", priority:0, votes:0 },
   ]
})

rs.initiate({
   _id : "rs0",
   members: [
      { _id: 0, host: "vm1.bizflycloud.tuana9a.tech:27017", priority: 3 },
      { _id: 1, host: "vm2.bizflycloud.tuana9a.tech:27017", priority: 2 },
      { _id: 2, host: "vm3.bizflycloud.tuana9a.tech:27017", priority: 1 },
      { _id: 3, host: "vm4.bizflycloud.tuana9a.tech:27017", priority: 1 },
   ]
})

rs.reconfig({
   _id : "rs0",
   members: [
      { _id: 0, host: "vm1.bizflycloud.tuana9a.tech:27017", priority: 3 },
      { _id: 1, host: "vm2.bizflycloud.tuana9a.tech:27017", priority: 2 },
      { _id: 2, host: "vm3.bizflycloud.tuana9a.tech:27017", priority: 1 },
      { _id: 3, host: "vm4.bizflycloud.tuana9a.tech:27017", priority: 1 },
   ]
})


# members =======================================================================
rs.add( { host: "vm-01.local:27017" } )
rs.add( { host: "vm-02.local:27017" } )
rs.add( { host: "vm-03.local:27017" } )
rs.add( { host: "vm-04.local:27017" } )
rs.add( { host: "vm-05.local:27017" } )
rs.add( { host: "vm-06.local:27017" } )

rs.add( { host: "vm-04.local:27017", priority:0, votes:0 } )
rs.add( { host: "vm-05.local:27017", priority:0, votes:0 } )
rs.add( { host: "vm-06.local:27017", priority:0, votes:0 } )

rs.remove("vm-01.local:27017")
rs.remove("vm-02.local:27017")
rs.remove("vm-03.local:27017")
rs.remove("vm-04.local:27017")
rs.remove("vm-05.local:27017")
rs.remove("vm-06.local:27017")

# reconfig =======================================================================
rs.reconfig({
   _id : "rs0",
   members: [
      { _id: 0, host: "vm-01.local:27017" },
      { _id: 1, host: "vm-02.local:27017", priority:0, slaveDelay: 60 },
      { _id: 2, host: "vm-03.local:27017" },
   ]
})

rs.reconfig({
   _id : "rs0",
   members: [
      { _id: 0, host: "vm-01.local:27017", priority: 2 },
      { _id: 1, host: "vm-02.local:27017", priority: 0 },
      { _id: 2, host: "vm-03.local:27017", arbiterOnly: true },
      { _id: 3, host: "vm-04.local:27017", priority:0, hidden: true },
      { _id: 4, host: "vm-05.local:27017", priority:0, slaveDelay: 300 },
      { _id: 5, host: "vm-06.local:27017", priority:0, votes:0 },
   ]
})

rs.reconfig({
   _id : "rs0",
   members: [
      { _id: 0, host: "vm-01.local:27017" },
      { _id: 1, host: "vm-02.local:27017" },
      { _id: 2, host: "vm-03.local:27017" },
      { _id: 3, host: "vm-04.local:27017" },
      { _id: 4, host: "vm-05.local:27017", priority:0, votes:0 },
      { _id: 5, host: "vm-06.local:27017", priority:0, votes:0 },
   ]
})

