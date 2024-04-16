function onUse(cid, item, frompos, item2, topos)

randompos1 = {x=474, y=44, z=7}
randompos2 = {x=474, y=46, z=7}
randompos3 = {x=474, y=48, z=7}
newpos = {x=476, y=51, z=7}
playerpos = getPlayerPosition(cid)
getplayer = getThingfromPos(playerpos)
mat = math.random (1,10)

  if item.itemid == 1945 and mat < 2 then
  doTeleportThing(cid,newpos,0)
  doSendMagicEffect(newpos,5)
  doSendMagicEffect(randompos2,8)
  doTransformItem(item.uid,item.itemid+1)
  
  elseif item.itemid == 1945 and mat > 2 and mat < 6 then
  doSendMagicEffect(randompos1,2)
  doPlayerSay(cid,"Hahahaha!",16)
  doTransformItem(item.uid,item.itemid+1)
  doSendMagicEffect(playerpos,0)
  doCreatureAddHealth(cid,-15)
	doSendAnimatedText(playerpos,15,180)
   
  elseif item.itemid == 1945 and mat > 5 then
  doSendMagicEffect(randompos3,2)
  doPlayerSay(cid,"Hahahaha!",16)
  doTransformItem(item.uid,item.itemid+1)
  doSendMagicEffect(playerpos,0)
  doCreatureAddHealth(cid,-15)
	doSendAnimatedText(playerpos,15,180)
  
  elseif item.itemid == 1946 then
  doTransformItem(item.uid,item.itemid-1)
        
	else
	  doPlayerSay(cid,"Hahahaha!",16)
	end
	return 1

	end