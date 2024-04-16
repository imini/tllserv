function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3905) == -1 then
	if getPlayerFreeCap(cid) < 13 then
	doPlayerSendTextMessage(cid,22,"You have found a book that weighs 13 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3905,1)
	parchment = doPlayerAddItem(cid,1950,1)
	doSetItemActionId(parchment,3436)
  doSetItemText(parchment,"Today I recieved one of the twins. It is made out of rare elven oak wood and stands in my secret office for the time being. I dare not even speculate about their earlier whereabouts but all I for now can think of is that one is mine, and that the secret has been passed on to me.  No person or personell have the authority to enter this office, so I see no reason for myself to worry about the safety of my twin.  However, I am unavoidbly worried about its brother. Such a rarity should not be in the hands of anyone else than the king's, but I have learnt that its purpose is needless to say wasted unless these twins occupies different locations. I allow the one I trust most to guard the second.                                                             I also learnt that a confusion spell has been cast over the mechanism creator so that I need not worry about anyone unlocking the twins’ secret... until time is proper.                                                     Time, speaking of the subject, is proper when the reversed embraces its true guise.")
	doPlayerSendTextMessage(cid,22,"You have found a book.")
	end
else
doPlayerSendTextMessage(cid,22,"The drawer is empty.")
end
return 1
end
