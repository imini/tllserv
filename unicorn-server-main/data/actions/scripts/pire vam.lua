function onUse(cid, item, frompos, item2, topos)

summonpos1 = {x=714,y=470,z=9}

if item.itemid == 1945 then
broadcastMessage("Pire Vam has returned to his old mansion to avenge his and his family's death.", MESSAGE_EVENT_ADVANCE)
doSummonCreature("Pire Vam",summonpos1)
doTransformItem(item.uid,1946)
else
return FALSE
end
return 1
end
