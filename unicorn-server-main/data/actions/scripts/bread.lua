function onUse(cid, item, frompos, item2, topos)
if item2.itemid == 1786 or item2.itemid == 1788 or item2.itemid == 1790 or item2.itemid == 1792 then
doTransformItem(item.uid,2689)
doChangeTypeItem(item.uid,1)
end
end