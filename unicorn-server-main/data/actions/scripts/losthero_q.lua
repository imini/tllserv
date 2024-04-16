function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7137 then
    queststatus = getPlayerStorageValue(cid,2145)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a fire sword and some valuables.")
      doPlayerAddItem(cid,2392,1)
      doPlayerAddItem(cid,2151,7)
      setPlayerStorageValue(cid,2145,1)
    else
      doPlayerSendTextMessage(cid,22,"The box is empty.")
    end
  end
  return 1
end

