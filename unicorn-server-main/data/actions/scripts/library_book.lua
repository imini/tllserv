function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7147 then
    queststatus = getPlayerStorageValue(cid,2161)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a book.")
      lol = doPlayerAddItem(cid,1973,1)
      doSetItemActionId(lol,3436)
      doSetItemText(lol, "Before I left this prosperous island I made sure my belongings were well hidden in the stable. It is almost impossible to see my shining armor due to all the dirt. Hope noone will find it.") 

      setPlayerStorageValue(cid,2161,1)
    else
      doPlayerSendTextMessage(cid,22,"The bookcase is empty.")
    end
  end
  return 1
end

