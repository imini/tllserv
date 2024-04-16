function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7231 then
    queststatus = getPlayerStorageValue(cid,2724)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found 14 small emeralds.")
      doPlayerAddItem(cid,2149,14)
      setPlayerStorageValue(cid,2724,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

