function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3936) == -1 then
	if getPlayerFreeCap(cid) < 46 then
	doPlayerSendTextMessage(cid,22,"You have found a steel helmet that weighs 46 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3936,1)
	doPlayerAddItem(cid,2457,1)
	doPlayerSendTextMessage(cid,22,"You have found a steel helmet.")
	end
else
doPlayerSendTextMessage(cid,22,"The corpse is empty.")
end
return 1
end
