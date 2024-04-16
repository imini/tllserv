function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,2718)

		if value == -1 then
		if getPlayerFreeCap(cid) < 141 then
		doPlayerSendTextMessage(cid,22,"You have found a present. It weighs 141 oz., but you do not have enough cap.")
else
				container = doPlayerAddItem(cid, 1990, 1)
				setPlayerStorageValue(cid, 2718, 1)
					doAddContainerItem(container, 2518, 1)
					doAddContainerItem(container, 2214, 1)
					doAddContainerItem(container, 2391, 1)
					doPlayerSendTextMessage(cid,22,"You have found a present.")
end	
else 
				doPlayerSendTextMessage(cid,22,"It is empty.")
		end

		return 1
end