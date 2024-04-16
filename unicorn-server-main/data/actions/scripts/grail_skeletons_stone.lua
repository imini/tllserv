function onUse(cid, item, frompos, item2, topos)

stone = {x=190,y=34,z=10,stackpos=1}
getstone = getThingfromPos(stone)

if item.itemid == 1945 then
doRemoveItem(getstone.uid,1)
doRemoveItem(item.uid,1)

else
return 0
end
return 1
end