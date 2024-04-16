function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7507 then
    queststatus = getPlayerStorageValue(cid,4141)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found 9 assassin stars.")
      doPlayerAddItem(cid,7368,9)
      setPlayerStorageValue(cid,4141,1)
    else
      doPlayerSendTextMessage(cid,22,"The chest is empty.")
    end
  end
  return 1
end

