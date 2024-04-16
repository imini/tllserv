function onWalkIn(cid, item, topos)

tock = {x=458, y=510, z=8}
player = getPlayerPosition(cid)

if item.uid == 7190 and item.itemid == 5066 then
doPlayerAddHealth(cid,-50)
doSendAnimatedText(tock,75,180)
doSendMagicEffect(tock,15)
doSendMagicEffect(tock,13)
doMovePlayer(cid,0)
else
return 0
end
return 1
end

