function onUse(cid, item, frompos, item2, topos)
  stair1 = {x=301, y=287, z=8, stackpos=0}
  stair2 = {x=302, y=287, z=8, stackpos=0}
  player1 = {x=301, y=287, z=8, stackpos=253}
  player2 = {x=302, y=287, z=8, stackpos=253}
  getstair1 = getThingfromPos(stair1)
getstair2 = getThingfromPos(stair2)
getplayer1 = getThingfromPos(player1)
getplayer2 = getThingfromPos(player2)

if item.itemid == 1945 and getplayer1.itemid > 0 and getplayer2.itemid > 0 then
  doTransformItem(getstair1.uid,4837)
  doTransformItem(getstair2.uid,4837)
  doMoveCreature(getplayer1.uid,2)
  doMoveCreature(getplayer2.uid,2)
 doTransformItem(item.uid,item.itemid+1)
 
  elseif item.itemid == 1945 and getplayer1.itemid > 0 then
  doTransformItem(getstair1.uid,4837)
  doTransformItem(getstair2.uid,4837)
  doMoveCreature(getplayer1.uid,2)
 doTransformItem(item.uid,item.itemid+1)
 
 elseif item.itemid == 1945 and getplayer2.itemid > 0 then
  doTransformItem(getstair1.uid,4837)
  doTransformItem(getstair2.uid,4837)
  doMoveCreature(getplayer2.uid,2)
 doTransformItem(item.uid,item.itemid+1)
 
 
   elseif item.itemid == 1946 then
  doTransformItem(getstair1.uid,424)
  doTransformItem(getstair2.uid,424)
 doTransformItem(item.uid,item.itemid-1)
  
  else
  doTransformItem(getstair1.uid,4837)
  doTransformItem(getstair2.uid,4837)
  doTransformItem(item.uid,item.itemid+1)
    end
  return 1
end

