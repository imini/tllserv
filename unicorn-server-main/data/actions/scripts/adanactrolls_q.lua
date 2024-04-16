function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7013 then
    queststatus = getPlayerStorageValue(cid,2006)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a scale armor.")
      doPlayerAddItem(cid,2483,1)
      setPlayerStorageValue(cid,2006,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

