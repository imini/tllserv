function onUse(cid, item, frompos, item2, topos)
teleport = {x=922, y=803, z=15}
teleport1 = {x=922, y=803, z=15, stackpos=1}
npos = {x=915, y=826, z=14}
gettp = getThingfromPos(teleport1)

if item.itemid == 1945 then
doCreateTeleport(1387,npos,teleport)
doSendMagicEffect(teleport,10)
doTransformItem(item.uid,item.itemid+1)

elseif item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
doRemoveItem(gettp.uid,1)
end
return 1
end
