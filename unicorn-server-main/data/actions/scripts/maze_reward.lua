function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7287 then
    queststatus = getPlayerStorageValue(cid,3816)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a crown helmet.")
      doPlayerAddItem(cid,2491,1)
      setPlayerStorageValue(cid,3816,1)
    else
      doPlayerSendTextMessage(cid,22,"The box is empty.")
    end
  end
  return 1
end

