function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7128 then
    queststatus = getPlayerStorageValue(cid,2133)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found an evil queen's crown.")
      doPlayerAddItem(cid,2128,1)
      setPlayerStorageValue(cid,2133,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

