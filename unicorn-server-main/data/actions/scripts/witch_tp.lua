function onUse(cid, item, frompos, item2, topos)

if (isPlayer(cid)) == 1 then
doTransformItem(item.uid,1387)
doSendMagicEffect(topos,10)
else
return 0
end
return 1
end