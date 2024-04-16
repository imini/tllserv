function onUse(cid, item, frompos, item2, topos)
stor = getPlayerStorageValue(cid,2345)

		if stor == -1 then
				container = doPlayerAddItem(cid, 1987, 1)
				setPlayerStorageValue(cid, 2345, 1)
					doAddContainerItem(container, 2600, 1)
					doAddContainerItem(container, 2127, 1)
					doAddContainerItem(container, 6500, 3)
					doPlayerSendTextMessage(cid,22,"You have found a bag.")
	else 
				doPlayerSendTextMessage(cid,22,"The coffin is empty.")
		end

		return 1
end