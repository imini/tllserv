function onUse(cid, item, frompos, item2, topos)

newpos = {x=topos.x-1,y=topos.y,z=topos.z}

if item.itemid == 1410 then
doTransformItem(item.uid,4340)
doDecayItem(item.uid)
doSummonCreature("Vampire",newpos)
doPlayerSendTextMessage(cid,22,"You awoke an undead.")
doSetItemActionId(item.uid,9869)
else
return 0
end
return 1
end
