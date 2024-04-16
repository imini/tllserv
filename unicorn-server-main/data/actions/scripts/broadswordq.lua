function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3922) == -1 then
	if getPlayerFreeCap(cid) < 52 then
	doPlayerSendTextMessage(cid,22,"You have found a broad sword that weighs 52 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3922,1)
	doPlayerAddItem(cid,2413,1)
	doPlayerSendTextMessage(cid,22,"You have found a broad sword.")
	end
else
doPlayerSendTextMessage(cid,22,"The coffin is empty.")
end
return 1
end
