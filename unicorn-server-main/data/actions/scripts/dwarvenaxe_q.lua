function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7130 then
    queststatus = getPlayerStorageValue(cid,2135)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a dwarfish axe.")
      doPlayerAddItem(cid,2435,1)
      setPlayerStorageValue(cid,2135,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

