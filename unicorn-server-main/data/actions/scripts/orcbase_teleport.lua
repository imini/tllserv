function onUse(cid, item, frompos, item2, topos)
teleport = {x=922, y=800, z=15}
teleport1 = {x=922, y=800, z=15, stackpos=2}
npos = {x=915, y=826, z=14}
lolpos = {x=topos.x-1, y=topos.y, z=topos.z,stackpos=1}
gettp = getThingfromPos(teleport1)

if item.itemid == 1945 then
doCreateItem(1387,1,lolpos)
doCreateTeleport(1387,npos,teleport)
doSendMagicEffect(teleport,10)
doTransformItem(item.uid,item.itemid+1)

elseif item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
doRemoveItem(gettp.uid,1)
end
return 1
end
