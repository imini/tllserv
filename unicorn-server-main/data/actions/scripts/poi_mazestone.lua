function onUse(cid, item, frompos, item2, topos)
  stoneposs = {x=146, y=312, z=12}
  stonepos = {x=146, y=312, z=12, stackpos=1}
  getstone = getThingfromPos(stonepos)

  if item.itemid == 1945 then
  doRemoveItem(getstone.uid,1)
 doTransformItem(item.uid,item.itemid+1)
 
   elseif item.itemid == 1946 then
  doCreateItem(1304,1,stoneposs)
 doTransformItem(item.uid,item.itemid-1)
  
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
    end
  return 1
end

