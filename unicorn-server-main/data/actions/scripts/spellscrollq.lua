function onUse(cid, item, frompos, item2, topos)

stor = getPlayerStorageValue(cid,2385)

if stor == -1 then
doPlayerSendTextMessage(cid,22,"You have found an ancient spell scroll.")
doPlayerAddItem(cid,5956,1)
setPlayerStorageValue(cid,2385,1)
doSendMagicEffect(topos,5)
else
doPlayerSendTextMessage(cid,22,"You may only bring one scroll.")
end
return 1
end

