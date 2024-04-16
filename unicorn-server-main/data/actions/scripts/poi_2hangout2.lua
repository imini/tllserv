function onUse(cid, item, frompos, item2, topos)

  createpos = {x=102, y=232, z=11}
  removepos = {x=102, y=232, z=11, stackpos=1}
  getremove = getThingfromPos(removepos)
  
  stalagmite = {x=102, y=240, z=11}
  rstalagmite = {x=102, y=240, z=11, stackpos=1}
  getstalagmite = getThingfromPos(rstalagmite)
  
  if item.itemid == 1946 then
  doTransformItem(item.uid,item.itemid-1)
  doCreateItem(5770,1,createpos)
  doRemoveItem(getremove.uid,1)
  doCreateItem(387,1,stalagmite)
  
  elseif item.itemid == 1945 then
  doTransformItem(item.uid,item.itemid+1)
  doCreateItem(518,1,createpos)
  doCreateItem(4810,1,createpos)
  doRemoveItem(getstalagmite.uid,1)

  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
    end
  return 1
end

