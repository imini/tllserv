function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7247 then
    queststatus = getPlayerStorageValue(cid,5003)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a knight armor.")
      doPlayerAddItem(cid,2476,1)
      setPlayerStorageValue(cid,5003,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

