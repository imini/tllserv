function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7787 then
    queststatus = getPlayerStorageValue(cid,9705)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a present.")
      doPlayerAddItem(cid,2331,1)
      setPlayerStorageValue(cid,9705,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

