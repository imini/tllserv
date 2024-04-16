function onUse(cid, item, frompos, item2, topos)

up = {x=topos.x, y=topos.y+1, z=topos.z+1}
accessLevel = getPlayerAccess(cid)

if accessLevel > 3 and item.itemid == 384 then
doTeleportThing(cid,up,0)
end
return 1
end
