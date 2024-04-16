function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7210 then
    queststatus = getPlayerStorageValue(cid,2701)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found Boreg's shield, dripping with blood.")
      doPlayerAddItem(cid,2538,1)
      setPlayerStorageValue(cid,2701,1)
    else
      doPlayerSendTextMessage(cid,22,"The coffin is empty.")
    end
  end
  return 1
end

