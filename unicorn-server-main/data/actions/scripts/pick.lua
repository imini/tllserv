function onUse(cid, item, frompos, item2, topos)
  lavapos1 = {x=71, y=286, z=11}
  lavapos2 = {x=72, y=286, z=11}
  lavapos3 = {x=73, y=286, z=11}
  lavapos4 = {x=70, y=287, z=11}
  lavapos5 = {x=71, y=287, z=11}
  lavapos6 = {x=72, y=287, z=11}
  lavapos7 = {x=73, y=287, z=11}
  lavapos8 = {x=70, y=288, z=11}
  lavapos9 = {x=71, y=288, z=11}
  lavapos10 = {x=72, y=288, z=11}
  lavapos11 = {x=73, y=288, z=11}
  lavapos12 = {x=74, y=288, z=11}  
  lavapos13 = {x=70, y=289, z=11}
  lavapos14 = {x=71, y=289, z=11}
  lavapos15 = {x=72, y=289, z=11}
  lavapos16 = {x=73, y=289, z=11}
  lavapos17 = {x=74, y=289, z=11}
  lavapos18 = {x=73, y=290, z=11}
  lavapos19 = {x=74, y=290, z=11}
   stonepos = {x=73, y=286, z=11, stackpos=4}
  getstone = getThingfromPos(stonepos)
    
topos = {x=topos.x, y=topos.y, z=topos.z}
if item2.itemid == 0 then
 return 0
end

if item2.actionid == 7550 then
 doTransformItem(item2.uid,385)
 doDecayItem(item2.uid)
 end
 
 if item2.actionid == 7551 then
  doRemoveItem(getstone.uid,1)

  doCreateItem(5815,1,lavapos1)
  doCreateItem(5815,1,lavapos2)
  doCreateItem(5815,1,lavapos3)
  doCreateItem(5815,1,lavapos4)
  doCreateItem(5815,1,lavapos5)
  doCreateItem(5815,1,lavapos6)
  doCreateItem(5815,1,lavapos7)
  doCreateItem(5815,1,lavapos8)
  doCreateItem(5815,1,lavapos9)
  doCreateItem(5815,1,lavapos10)
  doCreateItem(5815,1,lavapos11)
  doCreateItem(5815,1,lavapos12)
    doCreateItem(2256,1,stonepos)
doCreateItem(5815,1,lavapos13)
doCreateItem(5815,1,lavapos14)
doCreateItem(5815,1,lavapos15)
doCreateItem(5815,1,lavapos16)
doCreateItem(5815,1,lavapos17)
doCreateItem(5815,1,lavapos18)
doCreateItem(5815,1,lavapos19)

else
 return 0
end    
return 1
end
