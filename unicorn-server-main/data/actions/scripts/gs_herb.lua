function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7315 then
    queststatus = getPlayerStorageValue(cid,3040)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a rare blood herb.")
      doPlayerAddItem(cid,2798,1)
      setPlayerStorageValue(cid,3040,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

