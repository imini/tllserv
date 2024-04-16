function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7212 then
    queststatus = getPlayerStorageValue(cid,2703)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a book.")
      lol = doPlayerAddItem(cid,1973,1)
      doSetItemActionId(lol,3436)
      doSetItemText(lol, "I can see the eyes of these god forsaken creeps wandering around in the dark night. I'm sure they are planning an attack on us... and to be sure I locked up all treasures in different ways. Hopefully, these tremendous beasts aren't capable of reading!") 

      setPlayerStorageValue(cid,2703,1)
    else
      doPlayerSendTextMessage(cid,22,"The bookcase is empty.")
    end
  end
  return 1
end

