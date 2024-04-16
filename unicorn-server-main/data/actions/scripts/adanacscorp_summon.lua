function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,2008)
summon = {x=501, y=615, z=9}

if item.uid == 7014 and item.itemid == 1410 and value == -1 then
doSummonCreature("Skeleton",summon)
doSendMagicEffect(summon,10)
setPlayerStorageValue(cid,2008,1)
else
doPlayerSendCancel(cid,"Sorry, not possible.")
return 1
end
end

