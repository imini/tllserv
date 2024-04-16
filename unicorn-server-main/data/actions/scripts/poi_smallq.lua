function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,4120)

		if value == -1 then
				container = doPlayerAddItem(cid, 5926, 1)
				setPlayerStorageValue(cid, 4120, 1)
					doAddContainerItem(container, 2152, 11)
					doAddContainerItem(container, 6561, 1)
					doAddContainerItem(container, 6300, 1)
					doAddContainerItem(container, 2168, 1)
					doAddContainerItem(container, 2260, 1)
					doAddContainerItem(container, 2006, 7)
					doAddContainerItem(container, 2273, 1)
					doAddContainerItem(container, 2273, 1)
					doAddContainerItem(container, 2273, 1)				
					doAddContainerItem(container, 2268, 1)
					doAddContainerItem(container, 2268, 1)
					doAddContainerItem(container, 2144, 3)
					doAddContainerItem(container, 2143, 5)
					doAddContainerItem(container, 5944, 2)
					doPlayerSendTextMessage(cid,22,"You have found a backpack.")
	else 
				doPlayerSendTextMessage(cid,22,"It is empty.")
		end

		return 1
end