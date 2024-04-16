function onUse(cid, item, frompos, item2, topos)

tp1 = {x=454, y=686, z=8, stackpos=253}
tp2 = {x=454, y=688, z=8, stackpos=253}
tp3 = {x=454, y=686, z=8}
tp4 = {x=454, y=688, z=8}
npos1 = {x=464, y=697, z=8}
npos2 = {x=469, y=697, z=8}
gettp1 = getThingfromPos(tp1)
gettp2 = getThingfromPos(tp2)

if item.itemid == 1945 and item.uid == 7249 then
doSendMagicEffect(tp3,12)
doSendMagicEffect(tp4,12)
doTeleportThing(gettp1.uid,npos1)
doTeleportThing(gettp2.uid,npos2)
doSendMagicEffect(npos1,13)
doSendMagicEffect(npos2,13)
  doTransformItem(item.uid,item.itemid+1)

elseif item.itemid == 1946 and item.uid == 7249 then
doTransformItem(item.uid,item.itemid-1)
  end
  return 1

end
