function onUse(cid, item, frompos, item2, topos)

door = {x=812, y=678, z=11, stackpos=1}
door1 = {x=812, y=678, z=11}
getdoor = getThingfromPos(door)

if item.itemid == 1946 and item.uid == 7066 then
	doRemoveItem(getdoor.uid,1)
	doTransformItem(item.uid,item.itemid-1)
	doCreateItem(5109,1,door1)
elseif item.itemid == 1945 and item.uid == 7066 then
    doRemoveItem(getdoor.uid,1)
  	doorie = doCreateItem(5108,1,door1)
  	doSetItemActionId(doorie,1224)
	doTransformItem(item.uid,item.itemid+1)
    else
      doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
    end
  return 1
end

