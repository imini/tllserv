function onUse(cid, item, frompos, item2, topos)

stonepos = {x=923, y=354, z=14, stackpos=3}
getstone = getThingfromPos(stonepos)
playerpos = getPlayerPosition(cid)

  if item.actionid == 7101 and item.itemid == 1945 then
	doRemoveItem(getstone.uid,1)
	doTransformItem(item.uid,item.itemid+1)

  elseif item.actionid == 7101 and item.itemid == 1946 then
	doCreateItem(389,1,stonepos)
	doTransformItem(item.uid,item.itemid-1)
    else
      doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
    end
  return 1
end

