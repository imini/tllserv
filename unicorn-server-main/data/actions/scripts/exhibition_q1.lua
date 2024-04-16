function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7007 then
    queststatus = getPlayerStorageValue(cid,2000)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a life ring.")
      doPlayerAddItem(cid,2168,1)
      setPlayerStorageValue(cid,2000,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

