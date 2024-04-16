function onUse(cid, item, frompos, item2, topos)

value = getPlayerStorageValue(cid,9464)

if value == -1 then
doPlayerAddOutfit(cid,251,2)
doPlayerAddOutfit(cid,252,2)
setPlayerStorageValue(cid,9464,1)
doPlayerSendTextMessage(cid,22,"You have found an addon cap.")
else
doPlayerSendTextMessage(cid,22,"It is empty.")
end
return 1
end