function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3933) == -1 then
	if getPlayerFreeCap(cid) < 30 then
	doPlayerSendTextMessage(cid,22,"You have found an iron helmet that weighs 30 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3933,1)
	doPlayerAddItem(cid,2459,1)
	doPlayerSendTextMessage(cid,22,"You have found an iron helmet under the stone.")
	end
else
doPlayerSendTextMessage(cid,22,"There is nothing under the stone.")
end
return 1
end
