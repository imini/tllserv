function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7166 then
    queststatus = getPlayerStorageValue(cid,2177)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a machete in the body.")
      doPlayerAddItem(cid,2420,1)
      setPlayerStorageValue(cid,2177,1)
    else
      doPlayerSendTextMessage(cid,22,"The dead body is empty.")
    end
  end
  return 1
end

