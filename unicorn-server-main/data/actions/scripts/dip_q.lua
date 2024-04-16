function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7537 then
    queststatus = getPlayerStorageValue(cid,4171)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a damaged helmet.")
      doPlayerAddItem(cid,2339,9)
      setPlayerStorageValue(cid,4171,1)
    else
      doPlayerSendTextMessage(cid,22,"The sarcophagus is empty.")
    end
  end
  return 1
end

