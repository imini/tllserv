function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7789 then
    queststatus = getPlayerStorageValue(cid,2342)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a bag.")
      doPlayerAddItem(cid,2330,1)
      setPlayerStorageValue(cid,2342,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

