function onWalkIn(cid, item, topos)

newpos = {x=813, y=489, z=10}
pos = {x=817, y=444, z=15}

if item.uid == 7291 and item.itemid == 471 then
doTeleportThing(cid,newpos)
doSendMagicEffect(newpos,10)
doSendMagicEffect(pos,10)

else
doPlayerSendTextMessage(cid,22,"Sorry, not possible")
end
return 1
end
