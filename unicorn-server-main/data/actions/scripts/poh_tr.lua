function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7242 then
    queststatus = getPlayerStorageValue(cid,5001)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a time ring")
      doPlayerAddItem(cid,2169,1)
      setPlayerStorageValue(cid,5001,1)
    else
      doPlayerSendTextMessage(cid,22,"The rottening body is empty.")
    end
  end
  return 1
end

