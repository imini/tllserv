function onUse(cid, item, frompos, item2, topos)
	
value = getPlayerStorageValue(cid,9665)

if value == 1 and item.itemid == 5736 then
doTransformItem(item.uid,5737)
doTeleportThing(cid,topos,1)

elseif value == -1 then
doPlayerSendTextMessage(cid,22,"It is locked.")

elseif item.itemid == 5737 then
return 0
end
return 1
end