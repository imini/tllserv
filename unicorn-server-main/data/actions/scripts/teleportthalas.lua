function onUse(cid, item, frompos, item2, topos)
npos = {x=180, y=208, z=13}
stone = {x=145, y=191, z=13, stackpos=1}
getstone = getThingfromPos(stone)
if (isPlayer(cid)) == 1 then
doRemoveItem(getstone.uid,1)
doCreateTeleport(1387,npos,topos)
doSendMagicEffect(topos,10)

else
return 0
end
return 1
end
