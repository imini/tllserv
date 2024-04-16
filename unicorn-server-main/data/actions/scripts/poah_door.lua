function onUse(cid, item, frompos, item2, topos)


if item.itemid == 1225 and item.uid == 7269 then
doPlayerSendTextMessage(cid,22,"This door seems to be sealed against unwanted intruders.")

else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end

