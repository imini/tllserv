function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7305 then
    queststatus = getPlayerStorageValue(cid,3032)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a skull staff.")
      doPlayerAddItem(cid,2436,1)
      setPlayerStorageValue(cid,3032,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

