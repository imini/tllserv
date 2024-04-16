function onUse(cid, item, frompos, item2, topos)
  tilepos1 = {x=146, y=145, z=10}
  tilepos2 = {x=147, y=145, z=10}
  tilepos3 = {x=146, y=146, z=10}
  tilepos4 = {x=146, y=146, z=10}

  if item.itemid == 1945 then
  doCreateItem(407,1,tilepos1)
  doCreateItem(407,1,tilepos2)
  doCreateItem(407,1,tilepos3)
  doCreateItem(407,1,tilepos4)
 doTransformItem(item.uid,item.itemid+1)
 
   elseif item.itemid == 1946 then
doCreateItem(598,1,tilepos1)
  doCreateItem(598,1,tilepos2)
  doCreateItem(598,1,tilepos3)
  doCreateItem(598,1,tilepos4)
 doTransformItem(item.uid,item.itemid-1)
  else
  doPlayerSendCancel(cid,"Sorry, not possible.")
    end
  return 1
end

