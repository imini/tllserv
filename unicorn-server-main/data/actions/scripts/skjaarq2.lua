function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7744 then
    queststatus = getPlayerStorageValue(cid,2346)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a dragon shield.")
      doPlayerAddItem(cid,2516,1)
      setPlayerStorageValue(cid,2346,1)
    else
      doPlayerSendTextMessage(cid,22,"The cofin is empty.")
    end
  end
  return 1
end

