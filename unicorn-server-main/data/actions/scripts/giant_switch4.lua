function onWalkIn(cid, item, topos)

stor1 = getPlayerStorageValue(cid,2720)
stor2 = getPlayerStorageValue(cid,2721)
stor3 = getPlayerStorageValue(cid,2722)
pos = {x=977, y=656, z=14}
newpos = {x=977, y=682, z=14}

if item.uid == 7240 and item.itemid == 471 and stor1 == 1 and stor2 == 1 and stor3 == 1 then
doSendMagicEffect(pos,12)

else
doTeleportThing(cid,newpos)
doSendMagicEffect(newpos,10)
end
return 1
end
