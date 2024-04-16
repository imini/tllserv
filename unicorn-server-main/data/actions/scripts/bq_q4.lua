function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7356 then
    queststatus = getPlayerStorageValue(cid,4008)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found boots of haste.")
      doPlayerAddItem(cid,2195,1)
      setPlayerStorageValue(cid,4008,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

