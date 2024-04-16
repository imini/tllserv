--Anstice's Incredible Teleport Rune
function onUse(cid, item, frompos, item2, topos)
if getPlayerAccess(cid) == 1 then
doSendMagicEffect(frompos,10)
doTeleportThing(cid,topos)
doSendMagicEffect(topos,10)
end
if getPlayerAccess(cid) == 0 then
doPlayerSendTextMessage(cid,22,"Only Gms can use this rune.")
end
return 1
end