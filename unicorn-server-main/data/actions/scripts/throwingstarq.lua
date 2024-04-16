function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3923) == -1 then
	if getPlayerFreeCap(cid) < 32 then
	doPlayerSendTextMessage(cid,22,"You have found 16 throwing stars that weighs 32 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3923,1)
	doPlayerAddItem(cid,2399,16)
	doPlayerSendTextMessage(cid,22,"You have found 16 throwing stars.")
	end
else
doPlayerSendTextMessage(cid,22,"The coffin is empty.")
end
return 1
end
