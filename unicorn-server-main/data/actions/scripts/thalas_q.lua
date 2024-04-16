function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7547 then
    queststatus = getPlayerStorageValue(cid,4178)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a gem holder.")
      doPlayerAddItem(cid,2336,9)
      setPlayerStorageValue(cid,4178,1)
    else
      doPlayerSendTextMessage(cid,22,"The sarcophagus is empty.")
    end
  end
  return 1
end

