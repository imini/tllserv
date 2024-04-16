function onUse(cid, item, frompos, item2, topos)

newpos = {x=877,y=743,z=10}

if isPlayer(cid) == 1 then
doTeleportThing(cid,newpos,0)
else
return 0
end
return 1
end