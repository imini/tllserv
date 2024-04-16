function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7510 then
    queststatus = getPlayerStorageValue(cid,4144)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a guardian shield.")
      doPlayerAddItem(cid,2515,1)
      setPlayerStorageValue(cid,4144,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

