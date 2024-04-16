function onUse(cid, item, frompos, item2, topos)
frompos = {x=523, y=787, z=7}
topos = {x=523, y=790, z=7}

if (isPlayer(cid)) == 1 then

doSendDistanceShoot(frompos, topos, CONST_ANI_ARROW)
doCreatureAddHealth(cid,-52)
doSendMagicEffect(topos,0)
doSendAnimatedText(topos,52,180)

end
end
