function onUse(cid, item, frompos, item2, topos)

moneypos = {x=813,y=797,z=11,stackpos=2}
getmoney = getThingfromPos(moneypos)
summonpos = {x=817,y=794,z=11}

if getmoney.itemid == 2148 and getmoney.type == 100 and item.itemid == 1945 then
doRemoveItem(getmoney.uid,100)
doTransformItem(item.uid,1946)
setGlobalStorageValue(27345,1)
doSummonCreature("Orc",summonpos)
doSendMagicEffect(moneypos,14)

elseif getmoney.itemid == 2152 and getmoney.type == 1 and item.itemid == 1945 then
doRemoveItem(getmoney.uid,1)
doTransformItem(item.uid,1946)
setGlobalStorageValue(27345,1)
doSummonCreature("Orc",summonpos)
doSendMagicEffect(moneypos,14)

elseif item.itemid == 1946 and getGlobalStorageValue(27345) == -1 then
doTransformItem(item.uid,1945)

elseif item.itemid == 1946 and getGlobalStorageValue(27345) == 1 then
doPlayerSendTextMessage(cid,22,"Wait for your turn.")

else
return 0
end
return 1
end





