function onUse(cid, item, frompos, item2, topos)

wall1 = {x=839, y=409, z=12}
wall = {x=839, y=409, z=12, stackpos=1}
getwall = getThingfromPos(wall)

if item.uid == 7120 and item.itemid == 1945 then
doRemoveItem(getwall.uid,1)
doSendMagicEffect(wall1,3)
doTransformItem(item.uid,item.itemid+1)

elseif item.uid == 7120 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
doCreateItem(1028,1,wall)
doSendMagicEffect(wall1,3)

else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end

