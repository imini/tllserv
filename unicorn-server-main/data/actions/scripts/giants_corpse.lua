function onUse(cid, item, frompos, item2, topos)

value1 = getPlayerStorageValue(cid,9952)
value2 = getPlayerStorageValue(cid,9953)
value3 = getPlayerStorageValue(cid,9861)
value4 = getPlayerStorageValue(cid,3142)
if value1 == 1 and value2 == -1 then
doPlayerSendTextMessage(cid,22,"You didn't find any helmet.")
setPlayerStorageValue(cid,9953,1)
doSendMagicEffect(topos,0)
elseif value1 == -1 and value3 == -1 then
doPlayerSendTextMessage(cid,22,"It's empty.")
elseif value3 == 1 and value4 == -1 then
doPlayerSendTextMessage(cid,22,"You found Ramsey the Reckless' lost helmet.")
doPlayerAddItem(cid,5924,1)
setPlayerStorageValue(cid,3142,1)
elseif value2 == 1 then
return 0
elseif value4 == 1 then
return 0
else
return 0
end
return 1
end