function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7067 then
    queststatus = getPlayerStorageValue(cid,2072)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a pair of crocodile boots.")
      doPlayerAddItem(cid,3982,1)
      setPlayerStorageValue(cid,2072,1)
    else
      doPlayerSendTextMessage(cid,22,"The dead body is empty.")
    end
  end
  return 1
end

