function onUse(cid, item, frompos, item2, topos)
if item.uid == 7862 then
    queststatus = getPlayerStorageValue(cid,9466)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a magic sapphire.")
      stone = doPlayerAddItem(cid,2146,1)
      doSetItemSpecialDescription(stone,"It's almost vibrating with magical power.")
      setPlayerStorageValue(cid,9466,1)
    else
      doPlayerSendTextMessage(cid,22,"The corpse is empty.")
    end
  end
return 1
end
