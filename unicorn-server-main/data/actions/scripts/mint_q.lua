function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7182 then
    queststatus = getPlayerStorageValue(cid,2204)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a hat of the mad.")
      doPlayerAddItem(cid,2662,1)
      setPlayerStorageValue(cid,2204,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

