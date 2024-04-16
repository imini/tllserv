function onUse(cid, item, frompos, item2, topos)

getpos = getPlayerPosition(cid)

if item.uid == 7134 and item.itemid == 1945 then
doSendMagicEffect(getpos,14)
setPlayerStorageValue(cid,2142,1)
doTransformItem(item.uid,item.itemid+1)

elseif item.uid == 7134 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)

else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end

