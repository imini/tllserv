function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3927) == -1 then
	if getPlayerFreeCap(cid) < 51 then
	doPlayerSendTextMessage(cid,22,"You have found a barbarian axe that weighs 51 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3927,1)
	doPlayerAddItem(cid,2429,1)
	doPlayerSendTextMessage(cid,22,"You have found a barbarian axe.")
	end
else
doPlayerSendTextMessage(cid,22,"The chest is empty.")
end
return 1
end
