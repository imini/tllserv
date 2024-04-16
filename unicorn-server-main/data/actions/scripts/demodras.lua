function onUse(cid, item, frompos, item2, topos)

summonpos1 = {x=924,y=870,z=11}
summonpos2 = {x=930,y=874,z=11}
summonpos3 = {x=922,y=874,z=11}

if item.itemid == 1945 then
broadcastMessage("The lord of the dragons has returned to the hellish caves in Lucifers graveyard.", MESSAGE_EVENT_ADVANCE)
doSummonCreature("Dragon Lord",summonpos1)
doSummonCreature("Dragon Lord",summonpos2)
doSummonCreature("Demodras",summonpos3)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
