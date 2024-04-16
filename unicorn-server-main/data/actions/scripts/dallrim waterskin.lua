function onUse(cid, item, frompos, item2, topos)

value1 = getPlayerStorageValue(cid,9938)
value2 = getPlayerStorageValue(cid,9939)

if value2 == -1 and value1 == 1 and item2.uid == 7780 then
doSendMagicEffect(topos,13)
doPlayerSendTextMessage(cid,22,"You have dug the grave and put some mud into the waterskin.")
setPlayerStorageValue(cid,9939,1)

elseif item2.uid == 7780 and value2 == 1 then
return 0

else
return 0
end
return 1
end
