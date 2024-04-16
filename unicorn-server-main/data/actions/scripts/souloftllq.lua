function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7336 then
    queststatus = getPlayerStorageValue(cid,3070)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a shield of honour.")
      doPlayerAddItem(cid,2517,1)
      setPlayerStorageValue(cid,3070,1)
    else
      doPlayerSendTextMessage(cid,22,"The corpse is empty.")
    end
  end
  return 1
end

