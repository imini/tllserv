function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,4143)

		if value == -1 then
				container = doPlayerAddItem(cid, 3939, 1)
				setPlayerStorageValue(cid, 4143, 1)
					doAddContainerItem(container, 2320, 1)
										doAddContainerItem(container, 2268, 2)

					doPlayerSendTextMessage(cid,22,"You have found a bag.")
	else 
				doPlayerSendTextMessage(cid,22,"It is empty.")
		end

		return 1
end