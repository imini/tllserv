function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7505 then
    queststatus = getPlayerStorageValue(cid,4140)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a shield of the mastermind.")
      doPlayerAddItem(cid,2514,1)
      setPlayerStorageValue(cid,4140,1)
    else
      doPlayerSendTextMessage(cid,22,"The corpse is empty.")
    end
  end
  return 1
end

