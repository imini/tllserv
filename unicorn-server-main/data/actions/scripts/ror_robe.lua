function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7082 then
    queststatus = getPlayerStorageValue(cid,2096)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a blue robe.")
      doPlayerAddItem(cid,2656,1)
      setPlayerStorageValue(cid,2096,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

