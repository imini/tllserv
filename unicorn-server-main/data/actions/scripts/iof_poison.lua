function onStepIn(cid, item, topos)

creature = {x=410, y=533, z=8}

player = getPlayerPosition(cid)

if item.uid == 7052 and item.itemid == 426 then
doSendMagicEffect(creature,8)
setPlayerStorageValue(cid,2047,1)
doTransformItem(item.uid,item.itemid-1)
else
return 0
end
return 1
end

function onStepOut(cid, item, frompos)

if item.uid == 7052 and item.itemid == 425 then
doTransformItem(item.uid,item.itemid+1)
else
return 0
end
return 1
end