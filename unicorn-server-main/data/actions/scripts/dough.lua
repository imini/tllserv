function onUse(cid, item, frompos, item2, topos)
if item2.itemid == 2692 then
doTransformItem(item2.uid,2693)
doPlayerRemoveItem(2692,1)
end
end