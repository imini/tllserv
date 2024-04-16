function onUse(cid, item, frompos, item2, topos)
stor = getPlayerStorageValue(cid,2344)

		if stor == -1 then
				container = doPlayerAddItem(cid, 1987, 1)
				setPlayerStorageValue(cid, 2344, 1)
					doAddContainerItem(container, 5909, 3)
					doAddContainerItem(container, 2147, 5)
					doAddContainerItem(container, 2165, 1)
					doAddContainerItem(container, 2133, 1)
					doAddContainerItem(container, 2134, 1)
					doPlayerSendTextMessage(cid,22,"You have found a bag.")
	else 
				doPlayerSendTextMessage(cid,22,"The barrel is empty.")
		end

		return 1
end