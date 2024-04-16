function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,1043) == -1 then
	if getPlayerFreeCap(cid) < 1 then
	doPlayerSendTextMessage(cid,22,"You have found a yellow gem that weighs 1 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,1043,1)
	doPlayerAddItem(cid,2154,1)
	doPlayerSendTextMessage(cid,22,"You have found a yellow gem.")
	end
else
doPlayerSendTextMessage(cid,22,"The chest is empty.")
end
return 1
end
