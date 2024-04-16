function onUse(cid, item, frompos, item2, topos)
  if item.uid == 9018 then
    queststatus = getPlayerStorageValue(cid,3815)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a golden armor.")
      doPlayerAddItem(cid,2466,1)
      setPlayerStorageValue(cid,3815,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

