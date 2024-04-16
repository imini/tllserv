function onWalkIn(cid, item, topos)

creature = {x=409, y=531, z=9}

player = getPlayerPosition(cid)

if item.uid == 7053 and item.itemid == 426 then
doSendMagicEffect(creature,15)
setPlayerStorageValue(cid,2048,1)
doTransformItem(item.uid,item.itemid-1)
else
return 0
end
return 1
end

function onWalkOut(cid, item, frompos)

if item.uid == 7053 and item.itemid == 425 then
doTransformItem(item.uid,item.itemid+1)
else
return 0
end
return 1
end