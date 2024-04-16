function onUse(cid, item, frompos, item2, topos)
if item2.itemid == 1384 or item2.itemid == 1382 or item2.itemid == 1383 then
doTransformItem(item.uid,3541)
doChangeTypeItem(item.uid,1)
end
end