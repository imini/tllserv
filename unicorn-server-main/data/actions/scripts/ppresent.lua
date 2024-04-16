function onUse(cid, item, frompos, item2, topos)

if (isPlayer(cid)) == 1 then
doRemoveItem(item.uid,1)
else
return 0
end
return 1
end