--Annihalator switch thingy by Gorgaz (chest script not included)
--Setup is easy to understand and is organized
function onUse(cid, item, frompos, item2, topos)
-----------------------------------------------------------------
-----------------------------------------------------------------
---------------------------Varialables---------------------------
-----------------------------------------------------------------
-----------------------------------------------------------------
player1pos = {x=931, y=366, z=13, stackpos=253}
player2pos = {x=930, y=366, z=13, stackpos=253}--second player pos
player3pos = {x=929, y=366, z=13, stackpos=253}--third player pos
player4pos = {x=928, y=366, z=13, stackpos=253}--fourth player pos

cdemon1pos = {x=872, y=397, z=15, stackpos=253}-- position of the first demon
cdemon2pos = {x=873, y=397, z=15, stackpos=253}-- position of the second demon
cdemon3pos = {x=868, y=395, z=15, stackpos=253}-- position of the third demon
cdemon4pos = {x=869, y=399, z=15, stackpos=253}-- position of the fourth demon
cdemon5pos = {x=870, y=395, z=15, stackpos=253}-- position of the fith demon
cdemon6pos = {x=871, y=399, z=15, stackpos=253}-- position of the sixth demon

check1pos = {x=871, y=397, z=15, stackpos=253}--pos1 were players get tp'd to when level is pull(also checks if anni in progress)
check2pos = {x=870, y=397, z=15, stackpos=253}--pos2 were players get tp'd to when level is pull(also checks if anni in progress)
check3pos = {x=869, y=397, z=15, stackpos=253}--pos3 were players get tp'd to when level is pull(also checks if anni in progress)
check4pos = {x=868, y=397, z=15, stackpos=253}--pos4 were players get tp'd to when level is pull(also checks if anni in progress)

trashpos = {x=882, y=371, z=15}--pos were the demons get tp'd to(blank tile on the map)

questlevel = 100 -- level to do the quest
access = 0 --set to 3 if you only want anni once per server reset unless a gm pulls lever, 0 if you want unlimited(like on pvp servers)
-----------------------------------------------------------------
-----------------------------------------------------------------
------------------------End Varialables---------------------------
-----------------------------------------------------------------
-----------------------------------------------------------------

player1 = getThingfromPos(player1pos)
player2 = getThingfromPos(player2pos)
player3 = getThingfromPos(player3pos)
player4 = getThingfromPos(player4pos)
check1 = getThingfromPos(check1pos)
check2 = getThingfromPos(check2pos)
check3 = getThingfromPos(check3pos)
check4 = getThingfromPos(check4pos)
cdemon1 = getThingfromPos(cdemon1pos)
cdemon2 = getThingfromPos(cdemon2pos)
cdemon3 = getThingfromPos(cdemon3pos)
cdemon4 = getThingfromPos(cdemon4pos)
cdemon5 = getThingfromPos(cdemon5pos)
cdemon6 = getThingfromPos(cdemon6pos)

	if item.uid == 5000 then
		if item.itemid == 1945 then
			

if check1.itemid == 0 and check2.itemid == 0 and check3.itemid == 0 and check4.itemid == 0 then


				if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 then

				player1level = getPlayerLevel(player1.uid)
				player2level = getPlayerLevel(player2.uid)
				player3level = getPlayerLevel(player3.uid)
				player4level = getPlayerLevel(player4.uid)


				if player1level >= questlevel and player2level >= questlevel and player3level >= questlevel and player4level >= questlevel then

					queststatus1 = getPlayerStorageValue(player1.uid,5000)
					queststatus2 = getPlayerStorageValue(player2.uid,5000)
					queststatus3 = getPlayerStorageValue(player3.uid,5000)
					queststatus4 = getPlayerStorageValue(player4.uid,5000)

					if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 then
			
						demon1pos = {x=cdemon1pos.x, y=cdemon1pos.y, z=cdemon1pos.z}
						demon2pos = {x=cdemon2pos.x, y=cdemon2pos.y, z=cdemon2pos.z}
						demon3pos = {x=cdemon3pos.x, y=cdemon3pos.y, z=cdemon3pos.z}
						demon4pos = {x=cdemon4pos.x, y=cdemon4pos.y, z=cdemon4pos.z}
						demon5pos = {x=cdemon5pos.x, y=cdemon5pos.y, z=cdemon5pos.z}
						demon6pos = {x=cdemon6pos.x, y=cdemon6pos.y, z=cdemon6pos.z}						 
						
						doSummonCreature("Demon", demon1pos)
						doSummonCreature("Demon", demon2pos)
						doSummonCreature("Demon", demon3pos)
						doSummonCreature("Demon", demon4pos)
						doSummonCreature("Demon", demon5pos)
						doSummonCreature("Demon", demon6pos)


						doSendMagicEffect(player1pos,2)
						doSendMagicEffect(player2pos,2)
						doSendMagicEffect(player3pos,2)
						doSendMagicEffect(player4pos,2)
						
						new1pos = {x=check1pos.x, y=check1pos.y, z=check1pos.z}
						new2pos = {x=check2pos.x, y=check2pos.y, z=check2pos.z}
						new3pos = {x=check3pos.x, y=check3pos.y, z=check3pos.z}
						new4pos = {x=check4pos.x, y=check4pos.y, z=check4pos.z}

						doTeleportThing(player1.uid,new1pos)
						doTeleportThing(player2.uid,new2pos)
						doTeleportThing(player3.uid,new3pos)
						doTeleportThing(player4.uid,new4pos)

						doSendMagicEffect(new1pos,10)
						doSendMagicEffect(new2pos,10)
						doSendMagicEffect(new3pos,10)
						doSendMagicEffect(new4pos,10)

						doTransformItem(item.uid,item.itemid+1)

					else
						doPlayerSendCancel(cid,"Someone in your team has already done this quest.")
					end
				else
				doPlayerSendCancel(cid, 'All players must be'..questlevel..' to do this quest.')
				end
			else
				doPlayerSendCancel(cid,"You need 4 players for this quest.")
			end
		else
					doPlayerSendCancel(cid,"There is currently a team in the quest room.")
		end

		elseif item.itemid == 1946 then
			if getPlayerAccess(cid) >= access then
				doTransformItem(item.uid,item.itemid-1)
			else
				doPlayerSendCancel(cid,"Sorry, not possible.")
			end
		end
		if check1.itemid == 0 and check2.itemid == 0 and check3.itemid == 0 and check4.itemid == 0 then
					if cdemon1.itemid > 0 and isPlayer(cdemon1.uid) == 0 then
			doTeleportThing(cdemon1.uid,trashpos)
					if cdemon2.itemid > 0 and isPlayer(cdemon2.uid) == 0 then
			doTeleportThing(cdemon2.uid,trashpos)
					if cdemon3.itemid > 0 and isPlayer(cdemon3.uid) == 0 then
			doTeleportThing(cdemon3.uid,trashpos)
					if cdemon4.itemid > 0 and isPlayer(cdemon4.uid) == 0 then
			doTeleportThing(cdemon4.uid,trashpos)
					if cdemon5.itemid > 0 and isPlayer(cdemon5.uid) == 0 then
			doTeleportThing(cdemon5.uid,trashpos)
					if cdemon6.itemid > 0 and isPlayer(cdemon6.uid) == 0 then
			doTeleportThing(cdemon6.uid,trashpos)
			end
		end
	end
end
end
end
end
end
end