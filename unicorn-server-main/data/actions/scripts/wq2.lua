function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,2342)

		if value == -1 then
if getPlayerFreeCap(cid) < 130 then
		doPlayerSendTextMessage(cid,22,"You do not have enough cap.")
else
				container = doPlayerAddItem(cid, 1996, 1)
				setPlayerStorageValue(cid, 2342, 1)
					doAddContainerItem(container, 2273 , 4)
          doAddContainerItem(container, 2179 , 1)
          doAddContainerItem(container, 2208 , 1)
          doAddContainerItem(container, 2209 , 1)
          doAddContainerItem(container, 2207 , 1)
          doAddContainerItem(container, 6088 , 1)
          doAddContainerItem(container, 2152 , 7)
          doAddContainerItem(container, 2516 , 1)
					doPlayerSendTextMessage(cid,22,"A bag was produced in your hands.")
end
	else 
				doPlayerSendTextMessage(cid,22,"Nothing is happening.")
		end

		return 1
end