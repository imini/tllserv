function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3920) == -1 then
	if getPlayerFreeCap(cid) < 80 then
	doPlayerSendTextMessage(cid,22,"You have found a brass armor that weighs 80 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3920,1)
	doPlayerAddItem(cid,2465,1)
	doPlayerSendTextMessage(cid,22,"You have found a brass armor.")
	end
else
doPlayerSendTextMessage(cid,22,"The box is empty.")
end
return 1
end
