function onUse(cid, item, frompos, item2, topos)
	if item.itemid == 1945 then
		player1pos = {x=962, y=440, z=7, stackpos=253}
		player1 = getThingfromPos(player1pos)
		player2pos = {x=868, y=383, z=7, stackpos=253}
		player2 = getThingfromPos(player2pos)
		player3pos = {x=763, y=646, z=11, stackpos=253}
		player3 = getThingfromPos(player3pos)
		player4pos = {x=693, y=474, z=10, stackpos=253}
		player4 = getThingfromPos(player4pos)
		if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 then
				nplayer1pos = {x=684, y=475, z=11}
				nplayer2pos = {x=713, y=475, z=11}
				nplayer3pos = {x=698, y=490, z=11}
				nplayer4pos = {x=700, y=462, z=11}
				doSendMagicEffect(player1pos,2)
				doSendMagicEffect(player2pos,2)
				doSendMagicEffect(player3pos,2)
				doSendMagicEffect(player4pos,2)
				doTeleportThing(0, player1.uid,nplayer1pos, 0)
				doTeleportThing(0, player2.uid,nplayer2pos, 0)
				doTeleportThing(0, player3.uid,nplayer3pos, 0)
				doTeleportThing(0, player4.uid,nplayer4pos, 0)
				doSendMagicEffect(nplayer1pos,10)
				doSendMagicEffect(nplayer2pos,10)
				doSendMagicEffect(nplayer3pos,10)
				doSendMagicEffect(nplayer4pos,10)
				doTransformItem(item.uid,item.itemid+1)
		else
			doCreatureSay(cid,"It's stuck as if made of stone.",16)
		end
	elseif item.itemid == 1946 then
		doTransformItem(item.uid,item.itemid-1)
	end
	return 1
end
