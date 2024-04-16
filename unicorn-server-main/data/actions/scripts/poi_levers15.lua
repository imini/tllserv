function onUse(cid, item, frompos, item2, topos)

  earlier = {x=85, y=260, z=13, stackpos=1}
  getearlier = getThingfromPos(earlier)
  stonepos1 = {x=92, y=259, z=12, stackpos=1}
stonepos2 = {x=93, y=259, z=12, stackpos=1}
  stonepos3 = {x=92, y=259, z=12}
stonepos4 = {x=93, y=259, z=12}
getstone1 = getThingfromPos(stonepos1)
getstone2 = getThingfromPos(stonepos2)

  if item.itemid == 1945 and getearlier.itemid == 1946 then
  doTransformItem(item.uid,item.itemid+1)
  doSendMagicEffect(stonepos3,4)
  doSendMagicEffect(stonepos4,4)
  doRemoveItem(getstone1.uid,1)
   doRemoveItem(getstone2.uid,1)
   
  elseif item.itemid == 1946 then
  doTransformItem(item.uid,item.itemid-1)
  doCreateItem(1304,1,stonepos3)
doCreateItem(1304,1,stonepos4)
  else
  doCreatureSay(cid,"The fifteenth lever won't budge... yet.",16)
    end
  return 1
end

