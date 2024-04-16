function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7355 then
    queststatus = getPlayerStorageValue(cid,4007)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a giant sword.")
      doPlayerAddItem(cid,2393,1)
      setPlayerStorageValue(cid,4007,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

