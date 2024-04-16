function onUse(cid, item, frompos, item2, topos)

newpos = {x=topos.x,y=topos.y,z=topos.z+1}

if (isPlayer(cid)) == 1 then
doTeleportThing(cid,newpos,0)
else
return 0
end
return 1
end
