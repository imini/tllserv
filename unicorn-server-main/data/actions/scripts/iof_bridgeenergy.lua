function onWalkIn(cid, item, topos)

tock = {x=455, y=510, z=8}
player = getPlayerPosition(cid)

if item.uid == 7189 and item.itemid == 6116 then

doPlayerAddHealth(cid,-50)
doSendAnimatedText(tock,75,17)
doSendMagicEffect(tock,12)
doMovePlayer(cid,0)
else
return 0
end
return 1
end

