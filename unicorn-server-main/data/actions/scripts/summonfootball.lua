function onUse(cid, item, frompos, item2, topos)

name = getPlayerName(cid)

if item2.actionid == 8348 then
doSummonCreature("Football",topos)
doSendMagicEffect(topos,10)
doSendMagicEffect(topos,14)
doRemoveItem(item.uid,1)
doSendMagicEffect(frompos,5)
doCreatureSay(cid,"" ..getPlayerName(cid).. " summoned a football. Let the game begin!",16)
else
doSendMagicEffect(topos,2)
end
return 1
end

