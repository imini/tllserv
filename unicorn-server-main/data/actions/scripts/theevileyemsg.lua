function onUse(cid, item, frompos, item2, topos)

if item.itemid == 1945 then
broadcastMessage("Beholders has been acting strange lately in the Ravenclaw Swamp.", MESSAGE_EVENT_ADVANCE)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
