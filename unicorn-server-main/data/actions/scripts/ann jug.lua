function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,9945)

if value == 1 and item2.itemid == 4142 then
doSendMagicEffect(topos,14)
doPlayerAddItem(cid,7244,1)
doRemoveItem(item.uid,1)
else
return 0
end
return 1
end
