function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7508 then
    queststatus = getPlayerStorageValue(cid,4142)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found an assassin coat.")
      doPlayerAddItem(cid,2660,1)
      setPlayerStorageValue(cid,4142,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

