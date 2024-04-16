 function onUse(cid, item, frompos, item2, topos)

topos = {x=topos.x,y=topos.y,z=topos.z}

if item.itemid == 2550 then
if item2.itemid == 2739 then
doTransformItem(item2.uid,2737)
doCreateItem(2694,1,topos)
doDecayItem(item2.uid)
else
return 0
end


elseif item.itemid == 2694 then
if item2.itemid == 1381 or item2.itemid == 1382 or item2.itemid == 1383 or item2.itemid == 1384 then
doTransformItem(item.uid,2692)
else
return 0
end


elseif item.itemid == 2692 then
if item2.itemid == 1775 or item2.itemid == 2005 or item2.itemid == 2006 then
if item2.type == 1 then
doChangeTypeItem(item2.uid,0)
doTransformItem(item.uid,2693)
else
return 0
end
else
return 0
end


elseif item.itemid == 2693 then
if item2.itemid == 1786 or item2.itemid == 1788 or item2.itemid == 1790 or item2.itemid == 1792 then
doRemoveItem(item.uid,1)
doCreateItem(2689,1,topos)
else
return 0
end

end
return 1
end