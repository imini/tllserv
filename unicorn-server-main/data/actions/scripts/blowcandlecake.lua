function onUse(cid, item, frompos, item2, topos)
name = getPlayerName(cid)
if item.itemid == 6280 then
doTransformItem(item.uid,item.itemid-1)
doCreatureSay(cid,"" ..getPlayerName(cid).. " blew out the candle.",16)
else
return 0
end
return 1
end

