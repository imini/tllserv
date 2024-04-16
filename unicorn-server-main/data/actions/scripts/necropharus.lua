function onUse(cid, item, frompos, item2, topos)

summonpos1 = {x=922,y=420,z=10}
summonpos2 = {x=930,y=419,z=10}
summonpos3 = {x=925,y=418,z=10}
holepos = {x=926,y=419,z=9}

if item.itemid == 1945 then
broadcastMessage("The undead necromancers has summoned Necropharus at a dark altar in Paschendale.", MESSAGE_EVENT_ADVANCE)
doSummonCreature("Necropharus",summonpos1)
doSummonCreature("Necromancer",summonpos2)
doSummonCreature("Necromancer",summonpos3)
doCreateItem(383,1,holepos)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
