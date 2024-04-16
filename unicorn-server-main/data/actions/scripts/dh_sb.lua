function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7090 then
    queststatus = getPlayerStorageValue(cid,2103)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a pair of steel boots.")
      doPlayerAddItem(cid,2645,1)
      setPlayerStorageValue(cid,2103,1)
    else
      doPlayerSendTextMessage(cid,22,"The box is empty.")
    end
  end
  return 1
end

