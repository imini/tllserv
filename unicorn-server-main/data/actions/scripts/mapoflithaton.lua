function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3900) == -1 then
	if getPlayerFreeCap(cid) < 9 then
	doPlayerSendTextMessage(cid,22,"You have found a map that weighs 8.30 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3900,1)
	doPlayerAddItem(cid,5091,1)
	doPlayerSendTextMessage(cid,22,"You have found a map hidden under some flour.")
	end
else
doPlayerSendTextMessage(cid,22,"The barrel is empty.")
end
return 1
end
