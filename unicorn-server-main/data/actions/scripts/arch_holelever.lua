
function onUse(cid, item, frompos, item2, topos)
  holepos = {x=203, y=194, z=11}
  
  if item.itemid == 1945 then
  doCreateItem(383,1,holepos)
  doTransformItem(item.uid,item.itemid+1)
  
  elseif item.itemid == 1946 then
  doCreateItem(353,1,holepos)
  doTransformItem(item.uid,item.itemid-1)
 
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
    end
  return 1
end

