function onUse(cid, item, frompos, item2, topos)

stonepos= {x=944, y=739, z=9, stackpos=1}
getstone = getThingfromPos(stonepos)

if item.uid == 7304 and item.itemid == 1945 then
doPlayerSay(cid,"It seems to be stuck.",16)

elseif item.uid == 7304 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
doRemoveItem(getstone.uid,1)

else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end

