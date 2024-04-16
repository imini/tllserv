function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3935) == -1 then
	if getPlayerFreeCap(cid) < 58 then
	doPlayerSendTextMessage(cid,22,"You have found a clerical mace that weighs 58 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3935,1)
	doPlayerAddItem(cid,2423,1)
	doPlayerSendTextMessage(cid,22,"You have found a clerical mace.")
	end
else
doPlayerSendTextMessage(cid,22,"The corpse is empty.")
end
return 1
end
