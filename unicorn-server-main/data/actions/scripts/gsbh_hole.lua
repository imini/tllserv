function onUse(cid, item, frompos, item2, topos)

holepos = {x=923, y=619, z=12}
holepos1 = {x=923, y=619, z=12, stackpos=0}
gethole = getThingfromPos(holepos1)

if item.uid == 7293 and item.itemid == 1945 then
doCreateItem(383,1,holepos)
doTransformItem(item.uid,item.itemid+1)

elseif item.uid == 7293 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
doTransformItem(gethole.uid,354)

else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end

