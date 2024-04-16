function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,1755) == -1 then
	if getPlayerFreeCap(cid) < 20 then
	doPlayerSendTextMessage(cid,22,"You have found an odhomer shield that weighs 20 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,1755,1)
	doPlayerAddItem(cid,7460,1)
	doPlayerSendTextMessage(cid,22,"You have found an odhomer shield.")
	end
	return TRUE
else
doPlayerSendTextMessage(cid,22,"The chest is empty.")
end
return TRUE
end
