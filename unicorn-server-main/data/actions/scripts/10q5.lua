function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,1052) == -1 then
	if getPlayerFreeCap(cid) < 42 then
	doPlayerSendTextMessage(cid,22,"You have found a skull helmet that weighs 42 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,1052,1)
	doPlayerAddItem(cid,5741,1)
	doPlayerSendTextMessage(cid,22,"You have found a skull helmet.")
	end
else
doPlayerSendTextMessage(cid,22,"The chest is empty.")
end
return 1
end
