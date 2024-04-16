function onUse(cid, item, frompos, item2, topos)
  if item.uid == 7098 then
    queststatus = getPlayerStorageValue(cid,2110)
    if queststatus == -1 then
      doPlayerSendTextMessage(cid,22,"You have found a book. The papyrus pages are sewn together with a silver thread.")
      lol = doPlayerAddItem(cid,1974,1)
      doSetItemActionId(lol,3435)
      doSetItemText(lol, "For a long time I have now searched all through the city, for answers to my quest. Surprisingly the nobility opposed my genious idea, while the peasants supported it. But whenever the nobility wants something, they get it... hmpf. But that doesn't matter, I have an allied which will help me fulfill my quest. Whenever I'm able to sneak back into the town, I will contact Rocky and tell him that the researches has gone well. And then we will not only get our revenge, but also find the solution of this quest.") 

      setPlayerStorageValue(cid,2110,1)
    else
      doPlayerSendTextMessage(cid,22,"The bookcase is empty.")
    end
  end
  return 1
end

