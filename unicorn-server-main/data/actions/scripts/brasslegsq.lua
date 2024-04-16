function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3921) == -1 then
	if getPlayerFreeCap(cid) < 38 then
	doPlayerSendTextMessage(cid,22,"You have found brass legs that weighs 38 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3921,1)
	doPlayerAddItem(cid,2478,1)
	doPlayerSendTextMessage(cid,22,"You have found brass legs.")
	end
else
doPlayerSendTextMessage(cid,22,"The box is empty.")
end
return 1
end
