function onWalkIn(cid, item, topos)

creature = {x=634, y=653, z=0}
basin1 = {x=636, y=658, z=0, stackpos=1}
basin2 = {x=636, y=657, z=0, stackpos=1}
basin3 = {x=636, y=656, z=0, stackpos=1}
getbasin1 = getThingfromPos(basin1)
getbasin2 = getThingfromPos(basin2)
getbasin3 = getThingfromPos(basin3)
player = getPlayerPosition(cid)

if item.uid == 7064 and item.itemid == 426 and getbasin1.itemid == 2229 and getbasin2.itemid == 2229 and getbasin3.itemid == 2229 then
doSendMagicEffect(creature,16)
doTransformItem(item.uid,item.itemid-1)
doSendMagicEffect(basin1,9)
doSendMagicEffect(basin2,9)
doSendMagicEffect(basin3,9)
doRemoveItem(getbasin1.uid,1)
doRemoveItem(getbasin2.uid,1)
doRemoveItem(getbasin3.uid,1)
setPlayerStorageValue(cid,2063,1)

elseif item.uid == 7064 and item.itemid == 426 then
doTransformItem(item.uid,item.itemid-1)
else
return 0
end
return 1
end

function onWalkOut(cid, item, frompos)
if item.uid == 7064 and item.itemid == 425 then
doTransformItem(item.uid,item.itemid+1)
else
return 0
end
return 1
end