function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7296 then
    queststatus = getPlayerStorageValue(cid,5048)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a star amulet, it's shining mystically.")
      doPlayerAddItem(cid,2138,1)
      setPlayerStorageValue(cid,5048,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

