function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,9717)

if item2.actionid == 1598 and value == 1 then
doTransformItem(item.uid,1993)
doSendMagicEffect(topos,13)
setPlayerStorageValue(cid,9722,1)
else
return 0
end
return 1
end

