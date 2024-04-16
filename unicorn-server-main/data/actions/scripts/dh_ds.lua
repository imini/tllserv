function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7091 then
    queststatus = getPlayerStorageValue(cid,2104)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a demon shield.")
      doPlayerAddItem(cid,2520,1)
      setPlayerStorageValue(cid,2104,1)
    else
      doPlayerSendTextMessage(cid,22,"The box is empty.")
    end
  end
  return 1
end

