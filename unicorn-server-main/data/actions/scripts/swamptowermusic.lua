function onUse(cid, item, frompos, item2, topos)

getpos = getPlayerPosition(cid)
newpos = {x=928, y=627, z=9}
topos = {x=928, y=631, z=9}

if item.uid == 7219 and item.itemid == 2370 then
doSendMagicEffect(getpos,14)
doTeleportThing(cid,newpos,0)
doSendMagicEffect(newpos,10)
doSendMagicEffect(topos,23)

else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end

