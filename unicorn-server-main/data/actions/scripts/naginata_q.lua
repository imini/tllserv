function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,4014)

	if value == -1 then
		if getPlayerFreeCap(cid) < 110 then
		doPlayerSendTextMessage(cid,22,"You have found a bag that weighs 110 oz. You do not have enough cap.")	
		else
		container = doPlayerAddItem(cid, 1987, 1)
		setPlayerStorageValue(cid, 4014, 1)
		doAddContainerItem(container, 2426, 1)
		doAddContainerItem(container, 2108, 1)
		doAddContainerItem(container, 2114, 1)
		doAddContainerItem(container, 2213, 1)
		doAddContainerItem(container, 2129, 1)
		doAddContainerItem(container, 2131, 1)
		doAddContainerItem(container, 2146, 6)
		doAddContainerItem(container, 2157, 1)
		doPlayerSendTextMessage(cid,22,"You have found a bag.")
		end
	else 
	doPlayerSendTextMessage(cid,22,"It is empty.")
	end
	return 1
end