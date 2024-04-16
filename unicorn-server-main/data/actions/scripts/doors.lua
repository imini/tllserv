function onUse(cid, item, fromPosition, itemEx, toPosition)
	local doorPosition = {x = toPosition.x, y = toPosition.y, z = toPosition.z, stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE}
	local doorCreature = getThingfromPos(doorPosition)
	
	if item.itemid == 1225 and item.actionid == 0 or
	item.itemid == 1223 and item.actionid == 0 or
	item.itemid == 6259 and item.actionid == 0 or
	item.itemid == 6261 and item.actionid == 0 or
	item.itemid == 1241 and item.actionid == 0 or
	item.itemid == 1243 and item.actionid == 0 or
	item.itemid == 1255 and item.actionid == 0 or
	item.itemid == 1257 and item.actionid == 0 or
	item.itemid == 3542 and item.actionid == 0 or
	item.itemid == 3551 and item.actionid == 0 or
	item.itemid == 5114 and item.actionid == 0 or
	item.itemid == 5105 and item.actionid == 0 or
	item.itemid == 5123 and item.actionid == 0 or
	item.itemid == 5132 and item.actionid == 0 or
	item.itemid == 5288 and item.actionid == 0 or
	item.itemid == 5290 and item.actionid == 0 or
	item.itemid == 6204 and item.actionid == 0 or
	item.itemid == 6202 and item.actionid == 0 or
	item.itemid == 6898 and item.actionid == 0 or
	item.itemid == 6907 and item.actionid == 0 or
	item.itemid == 7040 and item.actionid == 0 or
	item.itemid == 7049 and item.actionid == 0 then

	 doTransformItem(item.uid,item.itemid+1)	
	 doTeleportThing(cid,toPosition,1)
	 
	
	elseif isInArray(questDoors, item.itemid) == TRUE then
		if getPlayerStorageValue(cid, item.actionid) ~= -1 then
			doTransformItem(item.uid, item.itemid + 1)
			doTeleportThing(cid, toPosition, TRUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
		end
		return TRUE
	elseif isInArray(levelDoors, item.itemid) == TRUE then
		if item.actionid > 0 and getPlayerLevel(cid) >= item.actionid - 1000 then
			doTransformItem(item.uid, item.itemid + 1)
			doTeleportThing(cid, toPosition, TRUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Only the worthy may pass.")
		end
		return TRUE
	elseif isInArray(horizontalOpenDoors, item.itemid) == TRUE then
		doorPosition.y = doorPosition.y + 1
		if doorCreature.itemid > 0 then
			doTeleportThing(doorCreature.uid, doorPosition, TRUE)
		end
		doTransformItem(item.uid, item.itemid - 1)
		return TRUE
	elseif isInArray(verticalOpenDoors, item.itemid) == TRUE then
		doorPosition.x = doorPosition.x + 1
		if doorCreature.itemid > 0 then
			doTeleportThing(doorCreature.uid, doorPosition, TRUE)
		end
		doTransformItem(item.uid, item.itemid - 1)
		return TRUE
	elseif isInArray(keys, item.itemid) == TRUE then
		if itemEx.actionid > 0 then
			if item.actionid == itemEx.actionid then
				for i = 0, table.maxn(closedDoors) do
					if itemEx.itemid == closedDoors[i] then
						doTransformItem(itemEx.uid, openDoors[i])
						return TRUE
					end
				end
			end
			doPlayerSendCancel(cid, "The key does not match.")
			return TRUE
		end
	else
		for i = 0, table.maxn(closedDoors) do
			if item.itemid == closedDoors[i] then
				if item.actionid == 0 then
					doTransformItem(item.uid, openDoors[i])
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is locked.")
				end
				return TRUE
			end
		end
	end
	return FALSE
end