function onUse(cid, item, frompos, item2, topos)
  stonepos = {x=141, y=295, z=15, stackpos=1}
  getstone = getThingfromPos(stonepos)

  if item.itemid == 1945 and getstone.itemid == 1285 then
  doRemoveItem(getstone.uid,1)
 doTransformItem(item.uid,item.itemid+1)
 
  elseif item.itemid == 1945 and getstone.itemid ~= 1285 then
  doCreatureSay(cid,"The lever is stuck.",16)
 
   elseif item.itemid == 1946 then
 doTransformItem(item.uid,item.itemid-1)
  
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
    end
  return 1
end

