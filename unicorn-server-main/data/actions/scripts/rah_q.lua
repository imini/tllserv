function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7543 then
    queststatus = getPlayerStorageValue(cid,4174)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a helmet piece.")
      doPlayerAddItem(cid,2340,9)
      setPlayerStorageValue(cid,4174,1)
    else
      doPlayerSendTextMessage(cid,22,"The sarcophagus is empty.")
    end
  end
  return 1
end

