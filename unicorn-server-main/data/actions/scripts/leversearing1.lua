function onUse(cid, item, frompos, item2, topos)

if getGlobalStorageValue(39557) == -1 then
doTransformItem(item.uid,1946)
setGlobalStorageValue(39557,1)
else
doCreatureSay(cid,"The lever is stuck in this position.",16)
end
return 1
end