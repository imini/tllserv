function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3929) == -1 then
	if getPlayerFreeCap(cid) < 70 then
	doPlayerSendTextMessage(cid,22,"You have found a twohanded sword that weighs 70 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3929,1)
	doPlayerAddItem(cid,2377,1)
	doPlayerSendTextMessage(cid,22,"You have found a twohanded sword.")
	end
else
doPlayerSendTextMessage(cid,22,"The chest is empty.")
end
return 1
end
