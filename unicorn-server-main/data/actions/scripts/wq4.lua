function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,2345)
	if value == -1 then
		if getPlayerFreeCap(cid) < 99 then
		doPlayerSendTextMessage(cid,22,"You do not have enough cap.")

		else
		container = doPlayerAddItem(cid, 1996, 1)
		setPlayerStorageValue(cid, 2345, 1)
		doAddContainerItem(container, 2293 , 15)
         	doAddContainerItem(container, 2183 , 1)
          	doAddContainerItem(container, 2197 , 1)
          	doAddContainerItem(container, 6090 , 1)
          	doAddContainerItem(container, 2152 , 7)
          	doAddContainerItem(container, 2516 , 1)
		doPlayerSendTextMessage(cid,22,"A bag was produced in your hands.")
		end
	else
	doPlayerSendTextMessage(cid,22,"Nothing is happening.")

	end
	return 1
end