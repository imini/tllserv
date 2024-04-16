function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,2340)

	if value == -1 then
		if getPlayerFreeCap(cid) < 59 then
		doPlayerSendTextMessage(cid,22,"You do not have enough cap.")
		else
		container = doPlayerAddItem(cid, 1987, 1)
		setPlayerStorageValue(cid, 2340, 1)
		doAddContainerItem(container,2490, 1)
          	doAddContainerItem(container,2134, 1)
          	doAddContainerItem(container,2129, 1)
		doPlayerSendTextMessage(cid,22,"A bag was produced in your hands.")
		end
	else
	doPlayerSendTextMessage(cid,22,"The corpse is empty.")
	end
	return 1
end