function onUse(cid, item, frompos, item2, topos)
  stair1 = {x=263, y=149, z=8, stackpos=0}
  getstair1 = getThingfromPos(stair1)
  player = {x=263, y=149, z=8, stackpos=253}
  getplayer = getThingfromPos(player)
  
  if item.itemid == 2059 and getplayer.itemid > 0 then
  doTransformItem(getstair1.uid,3135)
 doTransformItem(item.uid,item.itemid-1)
 doMoveCreature(getplayer.uid,2)
 
   elseif item.itemid == 2058 then
  doTransformItem(getstair1.uid,3139)
 doTransformItem(item.uid,item.itemid+1)
  
  else
  doTransformItem(getstair1.uid,3135)
 doTransformItem(item.uid,item.itemid-1)
    end
  return 1
end

