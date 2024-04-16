function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7534 then
    queststatus = getPlayerStorageValue(cid,4167)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a helmet ornament.")
      doPlayerAddItem(cid,2335,9)
      setPlayerStorageValue(cid,4167,1)
    else
      doPlayerSendTextMessage(cid,22,"The sarcophagus is empty.")
    end
  end
  return 1
end

