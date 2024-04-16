function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,9434)

if value == -1 then
doPlayerAddOutfit(cid,251,0)
doPlayerAddOutfit(cid,252,0)
setPlayerStorageValue(cid,9434,1)
doPlayerSendTextMessage(cid,22,"You have found a norseman outfit.")
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
return 1
end