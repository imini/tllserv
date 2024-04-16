function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7226 then
    queststatus = getPlayerStorageValue(cid,2720)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a black shield.")
      doPlayerAddItem(cid,2529,1)
      setPlayerStorageValue(cid,2720,1)
    else
      doPlayerSendTextMessage(cid,22,"The body is empty.")
    end
  end
  return 1
end

