function onUse(cid, item, frompos, item2, topos)
playerpos = getPlayerPosition(cid)
door = {x=727, y=891, z=7, stackpos=1}
getdoor = getThingfromPos(door)

if item.aid == 5000 and item.itemid == 1227 then
doRemoveItem(getdoor.uid,1)
doCreateItem(1228,1,door)
doMovePlayer(cid,3)

else
doPlayerSendCancel(cid,"This is not possible.")
return 1
end
end

function onWalkOut(cid, item, frompos)
playerpos = getPlayerPosition(cid)
door = {x=727, y=891, z=7, stackpos=1}
getdoor = getThingfromPos(door)

if item.itemid == 407 then
doRemoveItem(getdoor.uid,1)
doCreateItem(1227,1,door)
doSetItemActionId(door.uid,5000)

	end

	return 1
end

