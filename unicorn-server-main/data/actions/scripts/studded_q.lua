function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7168 then
    queststatus = getPlayerStorageValue(cid,2179)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a pair of studded legs.")
      doPlayerAddItem(cid,2468,1)
      setPlayerStorageValue(cid,2179,1)
    else
      doPlayerSendTextMessage(cid,22,"The dead body is empty.")
    end
  end
  return 1
end

