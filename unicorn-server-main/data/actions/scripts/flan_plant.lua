function onUse(cid, item, frompos, item2, topos)

if item2.itemid == 4185 then
doSendMagicEffect(topos,14)
doPlayerAddItem(cid,4866,1)
doRemoveItem(item.uid,1)
else
return 0
end
return 1
end
