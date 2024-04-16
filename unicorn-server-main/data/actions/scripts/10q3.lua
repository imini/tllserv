function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,1045) == -1 then
	if getPlayerFreeCap(cid) < 30 then
	doPlayerSendTextMessage(cid,22,"You have found a wand of inferno that weighs 30 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,1045,1)
	doPlayerAddItem(cid,2187,1)
	doPlayerSendTextMessage(cid,22,"You have found a wand of inferno.")
	end
else
doPlayerSendTextMessage(cid,22,"The chest is empty.")
end
return 1
end
