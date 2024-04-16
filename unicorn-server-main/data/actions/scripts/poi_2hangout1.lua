function onUse(cid, item, frompos, item2, topos)

  createpos = {x=92, y=236, z=11}
  removepos = {x=92, y=236, z=11, stackpos=1}
  getremove = getThingfromPos(removepos)

  if item.itemid == 1945 then
  doTransformItem(item.uid,item.itemid+1)
  doCreateItem(5770,1,createpos)
  doRemoveItem(getremove.uid,1)
  
  elseif item.itemid == 1946 then
  doTransformItem(item.uid,item.itemid-1)
  doCreateItem(518,1,createpos)
doCreateItem(4810,1,createpos)
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
    end
  return 1
end

