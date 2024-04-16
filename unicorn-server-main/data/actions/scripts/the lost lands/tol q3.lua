function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,4013)

		if value == -1 then
				container = doPlayerAddItem(cid, 1987, 1)
				setPlayerStorageValue(cid, 4013, 1)
					doAddContainerItem(container, 2197, 5)
					doAddContainerItem(container, 2151, 7)
					doAddContainerItem(container, 2169, 1)
					doPlayerSendTextMessage(cid,22,"You have found a bag.")
	else 
				doPlayerSendTextMessage(cid,22,"It is empty.")
		end

		return 1
end