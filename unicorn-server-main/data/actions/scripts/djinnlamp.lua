function onUse(cid, item, frompos, item2, topos)

stor1 = getPlayerStorageValue(cid,4318)
stor2 = getPlayerStorageValue(cid,4320)
stor3 = getPlayerStorageValue(cid,4308)
stor4 = getPlayerStorageValue(cid,4310)

	if getPlayerStorageValue(cid,9541) == 9 and getPlayerItemCount(cid,2356) >= 1 then
		setPlayerStorageValue(cid,9542,10)
		doSendMagicEffect(topos,14)
		doCreatureSay(cid,"You have successfully exchanged Umars personal sleeping lamp.",16)

  elseif getPlayerStorageValue(cid,9543) == 9 and getPlayerItemCount(cid,2356) >= 1 then
    setPlayerStorageValue(cid,9543,10)
		doSendMagicEffect(topos,14)
		doCreatureSay(cid,"You have successfully exchanged Falors personal sleeping lamp.",16)
		
	elseif getPlayerStorageValue(cid,9541) > 10 then
    doPlayerSendCancel(cid,"You have already exchanged the lamp.")
   elseif getPlayerStorageValue(cid,9543) > 10 then
    doPlayerSendCancel(cid,"You have already exchanged the lamp.") 	
	else
return FALSE
	end
	return 1
end