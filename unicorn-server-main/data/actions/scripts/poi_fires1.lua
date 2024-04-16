function onUse(cid, item, frompos, item2, topos)

  firepos = {x=75, y=259, z=11, stackpos=1}
  getfire = getThingfromPos(firepos)
   firepos1 = {x=75, y=259, z=11} 
  if item.itemid == 1945 then
  doRemoveItem(getfire.uid,1)
  doTransformItem(item.uid,item.itemid+1)
  
  elseif item.itemid == 1946 then
  doCreateItem(6289,1,firepos1)
doTransformItem(item.uid,item.itemid-1)
  else
  doCreatureSay(cid,"Sorry, not possible.",16)
    end
  return 1
end

