function onUse(cid, item, frompos, item2, topos)
ropespot = {x=123, y=238, z=11}

if item.itemid == 1945 then
doTransformItem(item.uid,item.itemid+1)
doCreateItem(384,1,ropespot)

elseif item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)
doCreateItem(355,1,ropespot)
else
return 0
end
return 1
end