function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,1044) == -1 then
	if getPlayerFreeCap(cid) < 7 then
	doPlayerSendTextMessage(cid,22,"You have found boots of haste that weighs 7 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,1044,1)
	doPlayerAddItem(cid,2195,1)
	doPlayerSendTextMessage(cid,22,"You have found boots of haste.")
	end
else
doPlayerSendTextMessage(cid,22,"The chest is empty.")
end
return 1
end
