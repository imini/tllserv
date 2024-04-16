function onUse(cid, item, frompos, item2, topos)

summonpos1 = {x=833,y=388,z=13}
summonpos2 = {x=825,y=386,z=13}
summonpos3 = {x=832,y=385,z=13}
summonpos4 = {x=839,y=386,z=13}
summonpos5 = {x=821,y=387,z=13}
summonpos6 = {x=822,y=385,z=13}

if item.itemid == 1945 then
broadcastMessage("Unusual activity of stone golems has been reported from the mines below the Rocky Mountains.", MESSAGE_EVENT_ADVANCE)
doSummonCreature("Stone Golem",summonpos1)
doSummonCreature("Stone Golem",summonpos2)
doSummonCreature("Stone Golem",summonpos3)
doSummonCreature("Stone Golem",summonpos4)
doSummonCreature("Stone Golem",summonpos5)
doSummonCreature("Stone Golem",summonpos6)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
