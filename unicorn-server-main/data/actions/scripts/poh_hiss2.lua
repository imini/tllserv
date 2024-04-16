function onUse(cid, item, frompos, item2, topos)

playerpos = getPlayerPosition(cid)
clickp = {x=908, y=822, z=4}
newpos = {x=909, y=823, z=7}

if item.itemid == 1945 and item.uid == 7244 then
doTeleportThing(cid,clickp,0)
doSendMagicEffect(clickp,10)
doSendMagicEffect(newpos,2)
doTransformItem(item.uid,item.itemid+1)

elseif item.uid == 7244 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)

else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end

