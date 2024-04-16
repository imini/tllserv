function onUse(cid, item, frompos, item2, topos)
ropespot = {x=123, y=238, z=11}
npos = {x=195, y=344, z=10}
ropespot1 = {x=123, y=238, z=11, stackpos=0}
ropespot2 = {x=123, y=238, z=11, stackpos=1}
lever = {x=120, y=241, z=11, stackpos=1}
getlever = getThingfromPos(lever)
getropespot = getThingfromPos(ropespot1)
getropespot2 = getThingfromPos(ropespot2)
if item.itemid == 1945 and getropespot.itemid == 355 then
doTransformItem(item.uid,1946)
doCreateTeleport(1387,npos,ropespot)
doSendMagicEffect(ropespot,10)

elseif item.itemid == 1945 and getropespot.itemid == 384 then
doCreateItem(355,1,ropespot)
doCreateTeleport(1387,npos,ropespot)
doSendMagicEffect(ropespot,10)
doTransformItem(item.uid,1946)
doTransformItem(getlever.uid,1945)

elseif item.itemid == 1946 then
doTransformItem(item.uid,1945)
doRemoveItem(getropespot2.uid,1)

else
return 0
end
return 1
end