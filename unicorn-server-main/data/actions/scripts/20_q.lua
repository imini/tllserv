function onUse(cid, item, frompos, item2, topos)
    queststatus = getPlayerStorageValue(cid,9672)
    if queststatus == -1 then
	if getPlayerFreeCap(cid) < 97 then
	doPlayerSendTextMessage(cid,22,"You have found a bag. It weighs 97 oz.")
else
      doPlayerSendTextMessage(cid,22,"You have found a bag.")
      bag = doPlayerAddItem(cid,5927,1)
      doAddContainerItem(bag,5888,1)
      doAddContainerItem(bag,2145,1)
      doAddContainerItem(bag,2213,60)
      doAddContainerItem(bag,2170,200)
      doAddContainerItem(bag,2168,1)
      doAddContainerItem(bag,2789,95)
      doAddContainerItem(bag,2546,1)
      doAddContainerItem(bag,2515,1)
      setPlayerStorageValue(cid,9672,1)
end
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
return 1
end
