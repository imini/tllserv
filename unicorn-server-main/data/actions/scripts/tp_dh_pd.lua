function onUse(cid, item, frompos, item2, topos)
teleport = {x=941, y=409, z=8}
npos = {x=834, y=304, z=12}
teleport1 = {x=941, y=409, z=8, stackpos=3}
gettp = getThingfromPos(teleport1)

if item.itemid == 1945 and item.uid == 7085 then
  doCreateTeleport(1387,npos,teleport)
  doSendMagicEffect(teleport,10)
  doTransformItem(item.uid,1946)
  else
  doTransformItem(item.uid,1945)
  doRemoveItem(gettp.uid,1)
  doSendMagicEffect(teleport,10)
  end
return 1
end