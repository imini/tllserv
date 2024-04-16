function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,9669)
gvalue5 = getGlobalStorageValue(10509)
value1 = getPlayerStorageValue(cid,9670)

if gvalue5 == 1 and value1 == -1 then
doTransformItem(item.uid,5127)
doTeleportThing(cid,topos,1)
setPlayerStorageValue(cid,9669,1)
else
doPlayerSendTextMessage(cid,22,"It is locked.")
end
return 1
end
