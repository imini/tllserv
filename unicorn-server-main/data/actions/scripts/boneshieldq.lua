function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3930) == -1 then
	if getPlayerFreeCap(cid) < 55 then
	doPlayerSendTextMessage(cid,22,"You have found a bone shield that weighs 55 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3930,1)
	doPlayerAddItem(cid,2541,1)
	doPlayerSendTextMessage(cid,22,"You have found a bone shield.")
	end
else
doPlayerSendTextMessage(cid,22,"The chest is empty.")
end
return 1
end
