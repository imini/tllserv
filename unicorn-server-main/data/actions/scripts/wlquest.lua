function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,9878)

		if value == -1 then
				container = doPlayerAddItem(cid, 1996, 1)
				setPlayerStorageValue(cid, 9878, 1)
					doAddContainerItem(container, 2268 , 12)
          doAddContainerItem(container, 2173 , 1)
          doAddContainerItem(container, 2534 , 1)
      
					doPlayerSendTextMessage(cid,22,"You found a bag.")
	else 
				doPlayerSendTextMessage(cid,22,"The chest is empty.")
		end

		return 1
end