function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7016 then
    queststatus = getPlayerStorageValue(cid,2009)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a barbarian axe.")
      doPlayerAddItem(cid,2429,1)
      setPlayerStorageValue(cid,2009,1)
    else
      doPlayerSendTextMessage(cid,22,"It is empty.")
    end
  end
  return 1
end

