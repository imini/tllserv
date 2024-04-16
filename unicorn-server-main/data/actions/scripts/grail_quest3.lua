function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7835 then
    queststatus = getPlayerStorageValue(cid,9558)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a royal helmet.")
      doPlayerAddItem(cid,2498,1)
      setPlayerStorageValue(cid,9558,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

