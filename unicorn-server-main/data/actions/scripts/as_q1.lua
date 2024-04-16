function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7366 then
    queststatus = getPlayerStorageValue(cid,4015)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a mystic turban.")
      doPlayerAddItem(cid,2663,1)
      setPlayerStorageValue(cid,4015,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

