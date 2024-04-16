function onUse(cid, item, frompos, item2, topos)

summonpos1 = {x=877,y=606,z=13}

if item.itemid == 1945 then
broadcastMessage("General Murius is gathering his minotaurian forces under the swamps of Ravenclaw. Defeat him before he attack Casteldine.", MESSAGE_EVENT_ADVANCE)
doSummonCreature("General Murius",summonpos1)
doTransformItem(item.uid,1946)
else
doPlayerSendCancel(cid,"One time only.")
end
return 1
end
