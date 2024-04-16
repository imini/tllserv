function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3932) == -1 then
	if getPlayerFreeCap(cid) < 2 then
	doPlayerSendTextMessage(cid,22,"You have found a scarf that weighs 2 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3932,1)
	doPlayerAddItem(cid,2661,1)
	doPlayerSendTextMessage(cid,22,"You have found a scarf.")
	end
else
doPlayerSendTextMessage(cid,22,"The corpse is empty.")
end
return 1
end
