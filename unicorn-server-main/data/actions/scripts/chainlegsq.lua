function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3931) == -1 then
	if getPlayerFreeCap(cid) < 35 then
	doPlayerSendTextMessage(cid,22,"You have found chain legs that weighs 35 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3931,1)
	doPlayerAddItem(cid,2648,1)
	doPlayerSendTextMessage(cid,22,"You have found chain legs.")
	end
else
doPlayerSendTextMessage(cid,22,"The coffin is empty.")
end
return 1
end
