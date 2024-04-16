function onUse(cid, item, frompos, item2, topos)

bars = {x=165, y=471, z=10, stackpos=1}
getbars = getThingfromPos(bars)

if item.uid == 7185 and item.itemid == 1945 then
doRemoveItem(getbars.uid,1)
doTransformItem(item.uid,item.itemid+1)

elseif item.uid == 7185 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
doCreateItem(1547,1,bars)

else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end

