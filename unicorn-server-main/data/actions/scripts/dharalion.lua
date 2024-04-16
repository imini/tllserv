function onUse(cid, item, frompos, item2, topos)

summonpos1 = {x=713,y=425,z=10}

if item.itemid == 1945 then
broadcastMessage("Dharalion has returned to Ashbere to assist the elves in their war against Celeres.", MESSAGE_EVENT_ADVANCE)
doSummonCreature("Dharalion",summonpos1)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
