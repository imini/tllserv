function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7217 then
    queststatus = getPlayerStorageValue(cid,2714)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a wand of plague.")
      doPlayerAddItem(cid,2188,1)
      setPlayerStorageValue(cid,2714,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

