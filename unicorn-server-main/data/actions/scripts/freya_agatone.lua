function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,9894)
value2 = getPlayerStorageValue(cid,9895)

if value == 1 and value2 == -1 then
setPlayerStorageValue(cid,9895,1)
doPlayerSendTextMessage(cid,22,"You have read this ships log book.")

elseif value2 == 1 then
doPlayerSendTextMessage(cid,22,"You have already read this ships log book.")
else
return 1
end
return 1
end