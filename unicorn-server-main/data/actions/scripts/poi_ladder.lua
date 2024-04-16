function onUse(cid, item, frompos, item2, topos)
  ladderposs = {x=166, y=308, z=14}
  ladderpos = {x=166, y=308, z=14, stackpos=1}
  getladder = getThingfromPos(ladderpos)

  if item.itemid == 1945 then
  doCreateItem(1386,1,ladderposs)
 doTransformItem(item.uid,item.itemid+1)
 
   elseif item.itemid == 1946 then
  doRemoveItem(getladder.uid,1)
 doTransformItem(item.uid,item.itemid-1)
  
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
    end
  return 1
end

