function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7099 then
    queststatus = getPlayerStorageValue(cid,2111)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a tower shield.")
      doPlayerAddItem(cid,2528,1)
      setPlayerStorageValue(cid,2111,1)
    else
      doPlayerSendTextMessage(cid,22,"The box is empty.")
    end
  end
  return 1
end

