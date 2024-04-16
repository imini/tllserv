function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7063 then
    queststatus = getPlayerStorageValue(cid,2061)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found the ring of wishes.")
      doPlayerAddItem(cid,2357,1)
      setPlayerStorageValue(cid,2061,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

