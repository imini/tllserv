function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3901) == -1 then
	if getPlayerFreeCap(cid) < 2 then
	doPlayerSendTextMessage(cid,22,"You have found a scroll that weighs 2 oz. You don’t have enough cap.")	
	else
	setPlayerStorageValue(cid,3901,1)
	doPlayerAddItem(cid,5957,1)
	doPlayerSendTextMessage(cid,22,"You have found a scroll hidden behind a brick.")
	end
else
doPlayerSendTextMessage(cid,22,"The hollow brick is empty.")
end
return 1
end
