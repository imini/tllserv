function onUse(cid, item, frompos, item2, topos)

random = math.random(1,6)

if doPlayerRemoveMoney(cid, 1) == 1 and random == 1 then
doPlayerSendTextMessage(cid,22,"No luck this time.")
doTransformItem(item.uid,5792)
doSendMagicEffect(topos,26)

elseif doPlayerRemoveMoney(cid, 1) == 1 and random == 2 then
doPlayerSendTextMessage(cid,22,"No luck this time.")
doTransformItem(item.uid,5793)
doSendMagicEffect(topos,26)

elseif doPlayerRemoveMoney(cid, 1) == 1 and random == 3 then
doPlayerSendTextMessage(cid,22,"No luck this time.")
doTransformItem(item.uid,5793)
doSendMagicEffect(topos,26)

elseif doPlayerRemoveMoney(cid, 1) == 1 and random == 4 then
doPlayerSendTextMessage(cid,22,"No luck this time.")
doTransformItem(item.uid,5794)
doSendMagicEffect(topos,26)

elseif doPlayerRemoveMoney(cid, 1) == 1 and random == 5 then
doPlayerSendTextMessage(cid,22,"No luck this time.")
doTransformItem(item.uid,5795)
doSendMagicEffect(topos,26)

elseif doPlayerRemoveMoney(cid, 1) == 1 and random == 6 then
doTransformItem(item.uid,5796)
doSendMagicEffect(topos,26)
doPlayerSendTextMessage(cid,22,"Congratulations. You earned yourself a mug!")
doPlayerAddItem(cid,2012,0)
else
return 0
end
return 1
end



