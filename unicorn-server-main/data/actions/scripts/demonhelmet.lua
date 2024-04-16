-- Demon Helmet with Teleport Add/remov

function onUse(cid, item, frompos, item2, topos)
demonhelmetuniqueid = 7041
rockposition = {x=272, y=45, z=12, stackpos=1}
getrock = getThingfromPos(rockposition)
peopleposition = {x=rockposition.x, y=rockposition.y, z=rockposition.z, stackpos=253}
people = getThingfromPos(peopleposition)
teleportgotoposition = {x=185, y=192, z=7}
teleportcreateposition = {x=272, y=45, z=12}

if people.itemid == 0 then
if item.uid == demonhelmetuniqueid and item.itemid == 1945 and getrock.itemid == 1285 then
doRemoveItem(getrock.uid,1)
doTransformItem(item.uid,item.itemid+1)
addTeleport(teleportcreateposition,teleportgotoposition)
elseif item.uid == demonhelmetuniqueid and item.itemid == 1946 and getrock.itemid == 1387 then
removeTeleport(teleportcreateposition)
doCreateItem(1285,1,rockposition)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
else
peopleposition.x = rockposition.x+1
doTeleportThing(people.uid,peopleposition)
doCreateItem(1285,1,rockposition)
doTransformItem(item.uid,item.itemid-1)
removeTeleport(teleportcreateposition)
end
return 1
end