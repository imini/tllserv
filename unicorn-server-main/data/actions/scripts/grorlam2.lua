function onUse(cid, item, frompos, item2, topos)

summonpos1 = {x=822,y=386,z=13}
summonpos2 = {x=816,y=384,z=14}
summonpos3 = {x=823,y=384,z=14}
summonpos4 = {x=814,y=380,z=14}
summonpos5 = {x=811,y=382,z=14}
summonpos6 = {x=813,y=387,z=14}
summonpos7 = {x=813,y=389,z=14}
summonpos8 = {x=817,y=388,z=14}
summonpos9 = {x=819,y=386,z=14}

if item.itemid == 1945 then
broadcastMessage("The stone golems has summoned Grorlam in their secret altar in the mines of the Rocky Mountains.", MESSAGE_EVENT_ADVANCE)
doSummonCreature("Stone Golem",summonpos1)
doSummonCreature("Stone Golem",summonpos2)
doSummonCreature("Stone Golem",summonpos3)
doSummonCreature("Stone Golem",summonpos4)
doSummonCreature("Stone Golem",summonpos5)
doSummonCreature("Stone Golem",summonpos6)
doSummonCreature("Grorlam",summonpos7)
doSummonCreature("Stone Golem",summonpos8)
doSummonCreature("Stone Golem",summonpos9)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
