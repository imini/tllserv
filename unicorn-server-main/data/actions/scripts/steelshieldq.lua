function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3925) == -1 then
	if getPlayerFreeCap(cid) < 59 then
	doPlayerSendTextMessage(cid,22,"You have found a steel shield that weighs 59 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3925,1)
	doPlayerAddItem(cid,2509,1)
	doPlayerSendTextMessage(cid,22,"You have found a steel shield.")
	end
else
doPlayerSendTextMessage(cid,22,"The large trunk is empty.")
end
return 1
end
