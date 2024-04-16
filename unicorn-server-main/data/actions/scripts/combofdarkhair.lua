function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7580 then
    queststatus = getPlayerStorageValue(cid,9700)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found the Comb of Dark Hair.")
      doPlayerAddItem(cid,5945,1)
      setPlayerStorageValue(cid,9700,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

