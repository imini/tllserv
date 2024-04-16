function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7556 then
    queststatus = getPlayerStorageValue(cid,4187)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a right horn.")
      doPlayerAddItem(cid,2338,9)
      setPlayerStorageValue(cid,4187,1)
    else
      doPlayerSendTextMessage(cid,22,"The sarcophagus is empty.")
    end
  end
  return 1
end

