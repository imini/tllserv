function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7836 then
    queststatus = getPlayerStorageValue(cid,9559)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a serpent sword.")
      doPlayerAddItem(cid,2409,1)
      setPlayerStorageValue(cid,9559,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

