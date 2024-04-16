function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,2342)

		if value == -1 then
if getPlayerFreeCap(cid) < 109 then
		doPlayerSendTextMessage(cid,22,"You do not have enough cap.")
else
				container = doPlayerAddItem(cid, 1996, 1)
				setPlayerStorageValue(cid, 2342, 1)
					doAddContainerItem(container, 2304 , 10)
          doAddContainerItem(container, 2547 , 33)
          doAddContainerItem(container, 6529 , 4)
          doAddContainerItem(container, 6089 , 1)
          doAddContainerItem(container, 2152 , 7)
          doAddContainerItem(container, 2516 , 1)
					doPlayerSendTextMessage(cid,22,"A bag was produced in your hands.")
end
	else 
				doPlayerSendTextMessage(cid,22,"Nothing is happening.")
		end

		return 1
end