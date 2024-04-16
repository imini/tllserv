function onUse(cid, item, frompos, item2, topos)

if item.itemid == 1945 then
broadcastMessage("Bizarre rituals has been observed in the depths of Paschendale.", MESSAGE_EVENT_ADVANCE)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
