function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7367 then
    queststatus = getPlayerStorageValue(cid,4016)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a vampire shield.")
      doPlayerAddItem(cid,2534,1)
      setPlayerStorageValue(cid,4016,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

