function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7788 then
    queststatus = getPlayerStorageValue(cid,9704)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found Courier Fred's posthorn.")
      doPlayerAddItem(cid,2332,1)
      setPlayerStorageValue(cid,9704,1)
      setPlayerStorageValue(cid,9714,-1)
    else
      doPlayerSendTextMessage(cid,22,"The corpse is empty.")
    end
  end
  return 1
end

