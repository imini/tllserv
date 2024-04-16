function onUse(cid, item, frompos, item2, topos)
 
value = getPlayerStorageValue(cid,9836)

if value == -1 and item2.itemid == 5659 then
doSendMagicEffect(topos,14)
doPlayerSendTextMessage(cid,22,"You have collected a sample of a blooming Griffinclaw.")
setPlayerStorageValue(cid,9836,1)
elseif item2.itemid == 5687 then
doPlayerSendTextMessage(cid,22,"The flower is not blooming.")
elseif value == 1 then
return 0
else
return 0
end
return 1
end
