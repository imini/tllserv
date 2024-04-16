function onUse(cid, item, frompos, item2, topos)
  
  playerpos = getPlayerPosition(cid)
  position = {x=topos.x, y=topos.y, z=topos.z, stackpos=253}
  getposition = getThingfromPos(position)
  if item.itemid == 1235 then
  doTransformItem(item.uid,1236)
   setPlayerStorageValue(cid,4172,1)

  elseif item.itemid == 1236 and getposition.itemid > 0 then
  doTransformItem(item.uid,1235)
  doMoveCreature(cid,2)
  
  else
   doTransformItem(item.uid,1235)
    end
  return 1
end

