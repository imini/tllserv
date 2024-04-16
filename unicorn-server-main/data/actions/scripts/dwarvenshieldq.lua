function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3926) == -1 then
	if getPlayerFreeCap(cid) < 55 then
	doPlayerSendTextMessage(cid,22,"You have found a dwarven shield that weighs 55 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3926,1)
	doPlayerAddItem(cid,2525,1)
	doPlayerSendTextMessage(cid,22,"You have found a dwarven shield.")
	end
else
doPlayerSendTextMessage(cid,22,"The barrel is empty.")
end
return 1
end
