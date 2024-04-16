function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7123 then
    queststatus = getPlayerStorageValue(cid,2128)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found an elven amulet")
      doPlayerAddItem(cid,2198,1)
      setPlayerStorageValue(cid,2128,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

