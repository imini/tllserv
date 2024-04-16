function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3924) == -1 then
	if getPlayerFreeCap(cid) < 105 then
	doPlayerSendTextMessage(cid,22,"You have found a scale armor that weighs 105 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3924,1)
	doPlayerAddItem(cid,2483,1)
	doPlayerSendTextMessage(cid,22,"You have found a scale armor.")
	end
else
doPlayerSendTextMessage(cid,22,"The drawer is empty.")
end
return 1
end
