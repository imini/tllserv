function onUse(cid, item, frompos, item2, topos)

value1 = getPlayerStorageValue(cid,9881)
value2 = getPlayerStorageValue(cid,9882)
value3 = getPlayerStorageValue(cid,9687)
value4 = getPlayerStorageValue(cid,9693)
value5 = getPlayerStorageValue(cid,9694)

if value1 == 1 and item2.actionid == 8764 and value2 == -1 then
doSendMagicEffect(topos,14)
doPlayerSendTextMessage(cid,22,"You successfully mended the broken mailbox.")
setPlayerStorageValue(cid,9882,1)

elseif topos.x == 785 and topos.y == 752 and topos.z == 4 and value4 == -1 and value3 == 1 then
doTransformItem(item2.uid,4997)
doSendMagicEffect(topos,2)
setPlayerStorageValue(cid,9693,1)
doDecayItem(item2.uid)

elseif topos.x == 777 and topos.y == 752 and topos.z == 4 and value5 == -1 and value3 == 1 then
doTransformItem(item2.uid,4997)
doSendMagicEffect(topos,2)
setPlayerStorageValue(cid,9694,1)
doDecayItem(item2.uid)

else
return 0
end
return 1
end
