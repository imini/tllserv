function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7209 then
    queststatus = getPlayerStorageValue(cid,2700)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a boots of haste, dripping with blood.")
      doPlayerAddItem(cid,2195,1)
      setPlayerStorageValue(cid,2700,1)
    else
      doPlayerSendTextMessage(cid,22,"The coffin is empty.")
    end
  end
  return 1
end

