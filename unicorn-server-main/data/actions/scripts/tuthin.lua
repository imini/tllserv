function onUse(cid, item, frompos, item2, topos)

stor = getPlayerStorageValue(cid,4347)

if stor == 1 then
doCreatureSay(cid,"I hereby pay my tribute to the legend Tuthin.",16)
setPlayerStorageValue(cid,4348,1)
doSendMagicEffect(topos,17)

elseif stor == -1 then
return 0 
end
return 1
end