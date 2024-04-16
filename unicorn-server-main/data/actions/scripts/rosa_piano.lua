function onUse(cid, item, frompos, item2, topos)

wall1 = {x=852, y=380, z=11}

if item.uid == 7127 and item.itemid == 2082 then
setPlayerStorageValue(cid,2132,1)
doSendMagicEffect(wall1,19)

else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
return 1
end

