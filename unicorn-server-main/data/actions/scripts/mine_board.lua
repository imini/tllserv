function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7126 then
    queststatus = getPlayerStorageValue(cid,2131)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a scroll behind the board.")
      doPlayerAddItem(cid,5956,1)
      setPlayerStorageValue(cid,2131,1)
    else
      doPlayerSendTextMessage(cid,22,"There is nothing behind the board.")
    end
  end
  return 1
end

