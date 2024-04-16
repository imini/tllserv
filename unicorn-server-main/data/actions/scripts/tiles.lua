function onWalkIn(cid, item, topos)


if item.itemid == 426 then
doTransformItem(item.uid,item.itemid-1)

elseif item.itemid == 416 then
doTransformItem(item.uid,item.itemid+1)

elseif item.itemid == 446 then
doTransformItem(item.uid,item.itemid+1)

elseif item.itemid == 3216 then
doTransformItem(item.uid,item.itemid+1)

else
return 0
end
return 1
end

function onWalkOut(cid, item, topos)


if item.itemid == 426 then
doTransformItem(item.uid,item.itemid+1)

elseif item.itemid == 416 then
doTransformItem(item.uid,item.itemid-1)

elseif item.itemid == 446 then
doTransformItem(item.uid,item.itemid-1)

elseif item.itemid == 3216 then
doTransformItem(item.uid,item.itemid-1)

else
return 0
end
return 1
end