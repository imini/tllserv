function onUse(cid, item, frompos, item2, topos)

if item.actionid == 9805 then
if getPlayerStorageValue(cid,1751) == -1 then
	if getPlayerFreeCap(cid) < 35 then
	doPlayerSendTextMessage(cid,22,"You have found a mystic blade that weighs 35 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,1751,1)
	doPlayerAddItem(cid,7384,1)
	doPlayerSendTextMessage(cid,22,"You have found a mystic blade.")
	end
	return TRUE
else
doPlayerSendTextMessage(cid,22,"The chest is empty.")
end
return TRUE
end

if item.actionid == 9804 then
if getPlayerStorageValue(cid,1751) == -1 then
	if getPlayerFreeCap(cid) < 78 then
	doPlayerSendTextMessage(cid,22,"You have found a cranial basher that weighs 78 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,1751,1)
	doPlayerAddItem(cid,7415,1)
	doPlayerSendTextMessage(cid,22,"You have found a cranial basher.")
	end
	return TRUE
else
doPlayerSendTextMessage(cid,22,"The chest is empty.")
end
return TRUE
end

if item.actionid == 9803 then
if getPlayerStorageValue(cid,1751) == -1 then
	if getPlayerFreeCap(cid) < 61 then
	doPlayerSendTextMessage(cid,22,"You have found a heroic axe that weighs 61 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,1751,1)
	doPlayerAddItem(cid,7389,1)
	doPlayerSendTextMessage(cid,22,"You have found a heroic axe.")
	end
	return TRUE
else
doPlayerSendTextMessage(cid,22,"The chest is empty.")
end
return TRUE
end
end