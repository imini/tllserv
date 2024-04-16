function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7533 then
    queststatus = getPlayerStorageValue(cid,4166)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a helmet adornement.")
      doPlayerAddItem(cid,2341,9)
      setPlayerStorageValue(cid,4166,1)
    else
      doPlayerSendTextMessage(cid,22,"The sarcophagus is empty.")
    end
  end
  return 1
end

