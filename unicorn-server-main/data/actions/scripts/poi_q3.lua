function onUse(cid, item, frompos, item2, topos)
value = getPlayerStorageValue(cid,4033)


		if value == -1 then
				container = doPlayerAddItem(cid, 2365, 1)
				setPlayerStorageValue(cid, 4033, 1)
					doAddContainerItem(container, 2268, 10)
					doAddContainerItem(container, 2273, 10)
					doAddContainerItem(container, 2311, 50)
					doAddContainerItem(container, 2313, 30)

					doPlayerSendTextMessage(cid,22,"You have found a backpack of holding.")
	else 
				doPlayerSendTextMessage(cid,22,"It is empty.")
		end

		return 1
end