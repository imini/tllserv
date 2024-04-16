function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,1033) == -1 then
	if getPlayerFreeCap(cid) < 22 then
	doPlayerSendTextMessage(cid,22,"You have found a blue robe that weighs 22 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,1033,1)
	doPlayerAddItem(cid,2656,1)
	doPlayerSendTextMessage(cid,22,"You have found a blue robe.")
	end
else
doPlayerSendTextMessage(cid,22,"The chest is empty.")
end
return 1
end
