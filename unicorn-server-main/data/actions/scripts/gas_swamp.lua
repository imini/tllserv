function onUse(cid, item, frompos, item2, topos)

swamp = {x=360, y=423, z=11}
borderget = {x=360, y=424, z=11, stackpos=1}
border = {x=360, y=424, z=11}
getborder = getThingfromPos(borderget)

if item.uid == 7156 and item.itemid == 1945 then
doSendMagicEffect(swamp,8)
doSendMagicEffect(border,8)
doTransformItem(item.uid,item.itemid+1)
doCreateItem(3196,1,swamp)
doRemoveItem(getborder.uid,1)

elseif item.uid == 7156 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
doCreateItem(4758,1,swamp)
doCreateItem(4725,1,border)
doSendMagicEffect(swamp,8)
doSendMagicEffect(border,8)

else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end

