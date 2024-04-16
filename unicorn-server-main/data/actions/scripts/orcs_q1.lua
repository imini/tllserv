function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7246 then
    queststatus = getPlayerStorageValue(cid,5002)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a skull staff.")
      doPlayerAddItem(cid,2436,1)
      setPlayerStorageValue(cid,5002,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

