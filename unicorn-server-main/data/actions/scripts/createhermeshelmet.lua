function onUse(cid, item, frompos, item2, topos)

newpos = {x=769,y=776,z=14}

if item.itemid == 1945 then
doTransformItem(item.uid,1946)
else
return 0
end
return 1
end