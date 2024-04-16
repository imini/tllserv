function onUse(cid, item, frompos, item2, topos)
teleport = {x=852, y=292, z=14}
teleport1 = {x=852, y=292, z=14, stackpos=1}
stonepos = {x=850, y=291, z=14, stackpos=1}
getstone = getThingfromPos(stonepos)
npos = {x=852, y=291, z=15}
gettp = getThingfromPos(teleport1)

if item.itemid == 1945 and item.uid == 7088 then
doCreateTeleport(1387,npos,teleport)
doSendMagicEffect(teleport,10)
doRemoveItem(getstone.uid,1)
  doTransformItem(item.uid,item.itemid+1)

elseif item.itemid == 1946 and item.uid == 7088 then
doTransformItem(item.uid,item.itemid-1)
doRemoveItem(gettp.uid,1)
doCreateItem(3607,1,stonepos)
  end
  return 1

end
