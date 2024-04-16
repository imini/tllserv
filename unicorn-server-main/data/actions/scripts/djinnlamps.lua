function onUse(cid, item, frompos, item2, topos)
stor = getPlayerStorageValue(cid,4320)

if item2.uid == 7566 and stor == -1 then
doSendMagicEffect(topos,13)
doPlayerSendTextMessage(cid,22,"You have successfully switched the orcs lamp against Umars.")
setPlayerStorageValue(cid,4320,1)

elseif item2.uid == 7655 and stor == 1 then
doSendMagicEffect(topos,2)
stor = getPlayerStorageValue(cid,4310)
elseif item2.uid == 7567 and stor1 == -1 then
doSendMagicEffect(topos,13)
doPlayerSendTextMessage(cid,22,"You have successfully switched the orcs lamp against H'temes'.")
setPlayerStorageValue(cid,4310,1)

elseif item2.uid == 7657 and stor1 == 1 then
doSendMagicEffect(topos,2)
else
return 0
end
return 1
end

