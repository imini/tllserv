function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7129 then
    queststatus = getPlayerStorageValue(cid,2134)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a crusader helmet.")
      doPlayerAddItem(cid,2497,1)
      setPlayerStorageValue(cid,2134,1)
    else
      doPlayerSendTextMessage(cid,22,"The dead body is empty.")
    end
  end
  return 1
end

