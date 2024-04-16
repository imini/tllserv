function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7158 then
    queststatus = getPlayerStorageValue(cid,2167)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a katana.")
      doPlayerAddItem(cid,2412,1)
      setPlayerStorageValue(cid,2167,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

