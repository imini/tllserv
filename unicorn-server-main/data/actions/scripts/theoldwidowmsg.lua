function onUse(cid, item, frompos, item2, topos)

if item.itemid == 1945 then
broadcastMessage("The mating season of the giant spiders is at hand. Leave the graveyard of Lucifer as fast as you can.", MESSAGE_EVENT_ADVANCE)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
