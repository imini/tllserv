function onUse(cid, item, frompos, item2, topos)
 
   	-- mummy quest
   	if item.uid == 6000 then
   		queststatus = getPlayerStorageValue(cid,6000)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 8 then
   				doPlayerSendTextMessage(cid,22,"You have found Scale Armor.")
   				doPlayerAddItem(cid,2483,1)
   				setPlayerStorageValue(cid,6000,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 8 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- mino quest
 	elseif item.uid == 6001 then
   		queststatus = getPlayerStorageValue(cid,6001)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 3 then
   				doPlayerSendTextMessage(cid,22,"You have found Chain Armor.")
   				doPlayerAddItem(cid,2464,1)
   				setPlayerStorageValue(cid,6001,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 3 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	-- sewers quest ii
 	elseif item.uid == 6002 then
   		queststatus = getPlayerStorageValue(cid,6002)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 3 then
   				doPlayerSendTextMessage(cid,22,"You have found Studded Armor.")
   				doPlayerAddItem(cid,2484,1)
   				setPlayerStorageValue(cid,6002,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 3 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- witch quest
 	elseif item.uid == 6003 then
   		queststatus = getPlayerStorageValue(cid,6003)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 6 then
   				doPlayerSendTextMessage(cid,22,"You have found Katana.")
   				doPlayerAddItem(cid,2412,1)
   				setPlayerStorageValue(cid,6003,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 6 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- orc quest
 	elseif item.uid == 6004 then
   		queststatus = getPlayerStorageValue(cid,6004)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 1 then
   				doPlayerSendTextMessage(cid,22,"You have found Silver Key.")
			        key = doPlayerAddItem(cid,2088,1)
    			        doSetItemActionId(key,3000)
   				setPlayerStorageValue(cid,6004,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 1 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- orc quest - chest
 	elseif item.uid == 6005 then
   		queststatus = getPlayerStorageValue(cid,6005)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 16 then
   				doPlayerSendTextMessage(cid,22,"You have found a Battle hammer and 70 gold pieces.")
			        doPlayerAddItem(cid,2417,1)
			        doPlayerAddItem(cid,2148,70)
   				setPlayerStorageValue(cid,6005,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 16 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end


	-- kildorn tomb quest
 	elseif item.uid == 6006 then
   		queststatus = getPlayerStorageValue(cid,6006)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 22 then
   				doPlayerSendTextMessage(cid,22,"You have found a Spike Sword.")
			        doPlayerAddItem(cid,2383,1)
   				setPlayerStorageValue(cid,6006,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 22 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end


	-- kildorn tomb quest
 	elseif item.uid == 6007 then
   		queststatus = getPlayerStorageValue(cid,6007)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 22 then
   				doPlayerSendTextMessage(cid,22,"You have found a Plate Armor.")
			        doPlayerAddItem(cid,2463,1)
   				setPlayerStorageValue(cid,6007,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 22 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- kildorn tomb quest
 	elseif item.uid == 6008 then
   		queststatus = getPlayerStorageValue(cid,6008)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 22 then
   				doPlayerSendTextMessage(cid,22,"You have found a Energy Ring.")
			        doPlayerAddItem(cid,2165,1)
   				setPlayerStorageValue(cid,6008,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 22 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- old tree
 	elseif item.uid == 6009 then
   		queststatus = getPlayerStorageValue(cid,6009)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 1 then
   				doPlayerSendTextMessage(cid,22,"You have found Bone Key.")
			        key = doPlayerAddItem(cid,2092,1)
    			        doSetItemActionId(key,3001)
   				setPlayerStorageValue(cid,6009,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 1 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- tomb iv
 	elseif item.uid == 6010 then
   		queststatus = getPlayerStorageValue(cid,6010)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 35 then
   				doPlayerSendTextMessage(cid,22,"You have found 5x Paralyze Rune.")
			        doPlayerAddItem(cid,2278,5)
   				setPlayerStorageValue(cid,6010,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 35 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- tomb iv
 	elseif item.uid == 6011 then
   		queststatus = getPlayerStorageValue(cid,6011)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 35 then
   				doPlayerSendTextMessage(cid,22,"You have found Warhammer.")
			        doPlayerAddItem(cid,2391,1)
   				setPlayerStorageValue(cid,6011,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 35 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- tomb iv
 	elseif item.uid == 6012 then
   		queststatus = getPlayerStorageValue(cid,6012)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 35 then
   				doPlayerSendTextMessage(cid,22,"You have found Noble Armor.")
			        doPlayerAddItem(cid,2486,1)
   				setPlayerStorageValue(cid,6012,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 35 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- black crypt quest
 	elseif item.uid == 6013 then
   		queststatus = getPlayerStorageValue(cid,6013)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 1 then
   				doPlayerSendTextMessage(cid,22,"You have found Chain Armor, Serpent Sword, 2 Books and Ethernal Rune.")
			        doPlayerAddItem(cid,2464,1)
			        doPlayerAddItem(cid,2409,1)
			        doPlayerAddItem(cid,2272,1)
			        book = doPlayerAddItem(cid,1971,1)
				doSetItemText(book, "I was too folish to attack Magic Eye...")
			        book = doPlayerAddItem(cid,1971,1)
				doSetItemText(book, "Mine friend died after entering that black circle. I need to find way how to dispell it.")
   				setPlayerStorageValue(cid,6013,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 1 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- black crypt quest *key part
 	elseif item.uid == 6014 then
   		queststatus = getPlayerStorageValue(cid,6014)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 15 then
   				doPlayerSendTextMessage(cid,22,"You have found Silver Key.")
			        key = doPlayerAddItem(cid,2088,1)
    			        doSetItemActionId(key,3003)
   				setPlayerStorageValue(cid,6014,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 15 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- black crypt quest *ogreblade part
 	elseif item.uid == 6015 then
   		queststatus = getPlayerStorageValue(cid,6015)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 22 then
   				doPlayerSendTextMessage(cid,22,"You have found a scroll.")
			        book = doPlayerAddItem(cid,1969,1)
				doSetItemText(book, "That magic glyph can be disspelled with only one rune.")
   				setPlayerStorageValue(cid,6015,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 22 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- black crypt quest *prize part
 	elseif item.uid == 6016 then
   		queststatus = getPlayerStorageValue(cid,6016)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 30 then
   				doPlayerSendTextMessage(cid,22,"You have found a book.")
				book = doPlayerAddItem(cid,2519,1)
				doSetItemText(book, "Tang Island covers the mystical Beholder City under it.")
   				setPlayerStorageValue(cid,6016,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 40 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- black crypt quest *prize part
 	elseif item.uid == 6017 then
   		queststatus = getPlayerStorageValue(cid,6017)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 30 then
   				doPlayerSendTextMessage(cid,22,"You have found Crown Helmet.")
			        doPlayerAddItem(cid,2491,1)
   				setPlayerStorageValue(cid,6017,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 40 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- orcs library
 	elseif item.uid == 6018 then
   		queststatus = getPlayerStorageValue(cid,6018)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 1 then
   				doPlayerSendTextMessage(cid,22,"You have found book and letter.")
			        book = doPlayerAddItem(cid,1971,1)
				doSetItemText(book, "We need to check what that Black Crypt. I asked Karin about it, but he thinks that Black Crypt is on Isles. So stupid guy.")
			        book = doPlayerAddItem(cid,1969,1)
				doSetItemText(book, "We see that activity in beholder city grown up. They started to send Gauts to attack us. We need to regroup.")
   				setPlayerStorageValue(cid,6018,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 1 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- wand quest
 	elseif item.uid == 6019 then
   		queststatus = getPlayerStorageValue(cid,6019)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 8 then
   				doPlayerSendTextMessage(cid,22,"You have found Wand of Vortex and 30gp.")
			        doPlayerAddItem(cid,2190,1)
				doPlayerAddItem(cid,2148,30)
   				setPlayerStorageValue(cid,6019,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 8 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- rod quest
 	elseif item.uid == 6020 then
   		queststatus = getPlayerStorageValue(cid,6020)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 8 then
   				doPlayerSendTextMessage(cid,22,"You have found Snakebite Rod and 30gp.")
				doPlayerAddItem(cid,2148,30)
			        doPlayerAddItem(cid,2182,1)
   				setPlayerStorageValue(cid,6020,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 8 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- mino quest
 	elseif item.uid == 6021 then
   		queststatus = getPlayerStorageValue(cid,6021)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 8 then
   				doPlayerSendTextMessage(cid,22,"You have found Book and 100gp.")
				doPlayerAddItem(cid,2148,100)
			        book = doPlayerAddItem(cid,1979,1)
				doSetItemText(book, "Its end, the gate to beholder city was sealed, now we are safe... until someone removes it! Though he need to found this city, its not so easy. As far as i know, its somewhere on Isles.")
   				setPlayerStorageValue(cid,6021,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 8 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6022 then
   		queststatus = getPlayerStorageValue(cid,6022)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 8 then
   				doPlayerSendTextMessage(cid,22,"You have found 2 Books, Knight Armor and 2000gp.")
				doPlayerAddItem(cid,2476,1)
				doPlayerAddItem(cid,2152,20)
			        book = doPlayerAddItem(cid,1975,1)
				doSetItemText(book, "Eht drowssap rof tsohg si nogard!")
			        book = doPlayerAddItem(cid,1975,1)
				doSetItemText(book, "Lleh fo dog, Rahtez ot yarp yehT .tluc nwo rieht evah skcolraw taht kniht i.")
   				setPlayerStorageValue(cid,6022,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 8 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6023 then
   		queststatus = getPlayerStorageValue(cid,6023)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 8 then
   				doPlayerSendTextMessage(cid,22,"You have found Book.")
			        book = doPlayerAddItem(cid,1976,1)
				doSetItemText(book, "Today I went visit The Old Hunter. He speaked about some enchanted bolts that could be useful. I need to try it.")
   				setPlayerStorageValue(cid,6023,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 8 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6024 then
   		queststatus = getPlayerStorageValue(cid,6024)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 8 then
   				doPlayerSendTextMessage(cid,22,"You have found Halberd.")
			        doPlayerAddItem(cid,2381,1)
   				setPlayerStorageValue(cid,6024,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 8 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6025 then
   		queststatus = getPlayerStorageValue(cid,6025)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 45 then
   				doPlayerSendTextMessage(cid,22,"You have found Bright Sword and Medusa Shield.")
			        doPlayerAddItem(cid,2407,1)
			        doPlayerAddItem(cid,2536,1)				
   				setPlayerStorageValue(cid,6025,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 45 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6026 then
   		queststatus = getPlayerStorageValue(cid,6026)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 12 then
   				doPlayerSendTextMessage(cid,22,"You have found a letter.")
			        book = doPlayerAddItem(cid,1948,1)
				doSetItemText(book, "Dear Gravel! \n I was thinking that you are getting lazy, so please send new pack of stones to mine new hideout near wastelands. Of course, DO NOT tell anyone about it. \n Greetings, Thantazar.")
   				setPlayerStorageValue(cid,6026,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 12 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end


 	elseif item.uid == 6027 then
   		queststatus = getPlayerStorageValue(cid,6027)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 50 then
   				doPlayerSendTextMessage(cid,22,"You have found Fire Axe.")
			        doPlayerAddItem(cid,2432,1)
   				setPlayerStorageValue(cid,6027,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 50 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end


 	elseif item.uid == 6028 then
   		queststatus = getPlayerStorageValue(cid,6028)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 50 then
   				doPlayerSendTextMessage(cid,22,"You have found Tower Shield.")
			        doPlayerAddItem(cid,2528,1)
   				setPlayerStorageValue(cid,6028,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 50 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end


 	elseif item.uid == 6029 then
   		queststatus = getPlayerStorageValue(cid,6029)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 50 then
   				doPlayerSendTextMessage(cid,22,"You have found Stone Skin Amulet.")
			        doPlayerAddItem(cid,2197,1)
   				setPlayerStorageValue(cid,6029,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 50 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6030 then
   		queststatus = getPlayerStorageValue(cid,6030)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 6 then
   				doPlayerSendTextMessage(cid,22,"You have found Book.")
				book = doPlayerAddItem(cid,1976,1)
				doSetItemText(book, "Today we went to hunt something big. We went to wastelands, to seek for something better than deers. Ariea has made a grass-trap. After a while we saw giant spider. He was trapped, so we injured him and took him here. I dont know if its eatable.")
   				setPlayerStorageValue(cid,6030,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 6 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6031 then
   		queststatus = getPlayerStorageValue(cid,6031)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 11 then
   				doPlayerSendTextMessage(cid,22,"You have found Scarf.")
				doPlayerAddItem(cid,2661,1)
   				setPlayerStorageValue(cid,6031,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 11 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6032 then
   		queststatus = getPlayerStorageValue(cid,6032)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 20 then
   				doPlayerSendTextMessage(cid,22,"You have found Two Handed Sword, Sword Ring and Dragon Necklace.")
				doPlayerAddItem(cid,2377,1)
				doPlayerAddItem(cid,2207,1)
				doPlayerAddItem(cid,2201,1)
   				setPlayerStorageValue(cid,6032,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 20 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6033 then
   		queststatus = getPlayerStorageValue(cid,6033)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 20 then
   				doPlayerSendTextMessage(cid,22,"You have found Axe Ring.")
				doPlayerAddItem(cid,2164,1)
   				setPlayerStorageValue(cid,6033,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 20 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6034 then
   		queststatus = getPlayerStorageValue(cid,6034)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 40 then
   				doPlayerSendTextMessage(cid,22,"You have found Skull Staff.")
				doPlayerAddItem(cid,2436,1)
				destpos = {x=887, y=224, z=10}
			   	doSummonCreature("dragon lord", destpos)
				destpos = {x=893, y=224, z=10}
			   	doSummonCreature("dragon lord", destpos)
				destpos = {x=890, y=224, z=10}
			   	doSummonCreature("elder beholder", destpos)
   				setPlayerStorageValue(cid,6034,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 50 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6035 then
   		queststatus = getPlayerStorageValue(cid,6035)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 20 then
   				doPlayerSendTextMessage(cid,22,"You have found Magic Lightwand.")
				doPlayerAddItem(cid,2162,1)
   				setPlayerStorageValue(cid,6035,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 20 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6036 then
   		queststatus = getPlayerStorageValue(cid,6036)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 20 then
   				doPlayerSendTextMessage(cid,22,"You have found Life Crystal.")
				doPlayerAddItem(cid,2177,1)
   				setPlayerStorageValue(cid,6036,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 20 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6037 then
   		queststatus = -1
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 20 then
   				doPlayerSendTextMessage(cid,22,"You have found Teh Sexy Blue Bag.")
				doPlayerAddItem(cid,1995,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 20 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6038 then
   		queststatus = getPlayerStorageValue(cid,6038)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 30 then
   				doPlayerSendTextMessage(cid,22,"You have found Elven Necklace.")
				doPlayerAddItem(cid,2198,1)
   				setPlayerStorageValue(cid,6038,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 30 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6039 then
   		queststatus = getPlayerStorageValue(cid,6039)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 30 then
   				doPlayerSendTextMessage(cid,22,"You have found Ring of Healing.")
				doPlayerAddItem(cid,2214,1)
   				setPlayerStorageValue(cid,6039,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 30 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6040 then
   		queststatus = getPlayerStorageValue(cid,6040)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 30 then
   				doPlayerSendTextMessage(cid,22,"You have found Silver Key.")
			        key = doPlayerAddItem(cid,2088,1)
    			        doSetItemActionId(key,3005)
   				setPlayerStorageValue(cid,6040,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 30 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6041 then
   		queststatus = getPlayerStorageValue(cid,6041)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 40 then
   				doPlayerSendTextMessage(cid,22,"You have found Knight Legs.")
			        doPlayerAddItem(cid,2477,1)
   				setPlayerStorageValue(cid,6041,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 40 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6042 then
   		queststatus = getPlayerStorageValue(cid,6042)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 40 then
   				doPlayerSendTextMessage(cid,22,"You have found Knight Axe.")
			        doPlayerAddItem(cid,2430,1)
   				setPlayerStorageValue(cid,6042,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 40 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6043 then
   		queststatus = getPlayerStorageValue(cid,6043)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 60 then
   				doPlayerSendTextMessage(cid,22,"You have found Giant Sword.")
			        doPlayerAddItem(cid,2393,1)
   				setPlayerStorageValue(cid,6043,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 60 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6044 then
   		queststatus = getPlayerStorageValue(cid,6044)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 60 then
   				doPlayerSendTextMessage(cid,22,"You have found Boots of Haste.")
			        doPlayerAddItem(cid,2195,1)
   				setPlayerStorageValue(cid,6044,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 60 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6045 then
   		queststatus = getPlayerStorageValue(cid,6045)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 20 then
   				doPlayerSendTextMessage(cid,22,"You have found Ice Rapier.")
			        doPlayerAddItem(cid,2396,1)
   				setPlayerStorageValue(cid,6045,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 20 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6046 then
   		queststatus = getPlayerStorageValue(cid,6046)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 20 then
   				doPlayerSendTextMessage(cid,22,"You have found Protection Amulet.")
			        doPlayerAddItem(cid,2200,1)
   				setPlayerStorageValue(cid,6046,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 20 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6047 then
   		queststatus = getPlayerStorageValue(cid,6047)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 20 then
   				doPlayerSendTextMessage(cid,22,"You have found Blue Robe.")
			        doPlayerAddItem(cid,2656,1)
   				setPlayerStorageValue(cid,6047,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 30 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6048 then
   		queststatus = getPlayerStorageValue(cid,6048)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 20 then
   				doPlayerSendTextMessage(cid,22,"You have found 20 Platinum Coins.")
			        doPlayerAddItem(cid,2152,20)
   				setPlayerStorageValue(cid,6048,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 30 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6049 then
   		queststatus = getPlayerStorageValue(cid,6049)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 20 then
   				doPlayerSendTextMessage(cid,22,"You have found Blue Gem.")
			        doPlayerAddItem(cid,2158,1)
   				setPlayerStorageValue(cid,6049,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 30 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6050 then
   		queststatus = getPlayerStorageValue(cid,6050)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 20 then
   				doPlayerSendTextMessage(cid,22,"You have found Might Ring.")
			        doPlayerAddItem(cid,2164,1)
   				setPlayerStorageValue(cid,6050,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 30 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6051 then
   		queststatus = getPlayerStorageValue(cid,6051)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 60 then
   				doPlayerSendTextMessage(cid,22,"You have found Magical Lamp.")
			        doPlayerAddItem(cid,2344,1)
   				setPlayerStorageValue(cid,6051,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 60 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6052 then
   		queststatus = getPlayerStorageValue(cid,6052)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 60 then
   				doPlayerSendTextMessage(cid,22,"You have found Dragon Lance.")
			        doPlayerAddItem(cid,2414,1)
   				setPlayerStorageValue(cid,6052,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 60 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6053 then
   		queststatus = getPlayerStorageValue(cid,6053)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 60 then
   				doPlayerSendTextMessage(cid,22,"You have found Magic Sword.")
			        doPlayerAddItem(cid,2400,1)
   				setPlayerStorageValue(cid,6053,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 100 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6054 then
   		queststatus = getPlayerStorageValue(cid,6053)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 60 then
   				doPlayerSendTextMessage(cid,22,"You have found Stonecutter's Axe.")
			        doPlayerAddItem(cid,2431,1)
   				setPlayerStorageValue(cid,6053,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 100 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6055 then
   		queststatus = getPlayerStorageValue(cid,6053)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 60 then
   				doPlayerSendTextMessage(cid,22,"You have found Demon Armor.")
			        doPlayerAddItem(cid,2494,1)
   				setPlayerStorageValue(cid,6053,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 100 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6056 then
   		queststatus = getPlayerStorageValue(cid,6053)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 60 then
   				doPlayerSendTextMessage(cid,22,"You have found Annihilator Bear.")
			        doPlayerAddItem(cid,2326,1)
   				setPlayerStorageValue(cid,6053,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 100 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6057 then
   		queststatus = getPlayerStorageValue(cid,6057)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 30 then
   				doPlayerSendTextMessage(cid,22,"You have found some gps.")
				cgold = math.random(20,80)
			        doPlayerAddItem(cid,2148,cgold)
   				setPlayerStorageValue(cid,6057,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 30 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6058 then
   		queststatus = getPlayerStorageValue(cid,6058)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 30 then
   				doPlayerSendTextMessage(cid,22,"You have found 30 platinum coins.")
			        doPlayerAddItem(cid,2152,30)
   				setPlayerStorageValue(cid,6058,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 30 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6059 then
   		queststatus = getPlayerStorageValue(cid,6059)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 30 then
   				doPlayerSendTextMessage(cid,22,"You have found 30 platinum coins.")
			        doPlayerAddItem(cid,2152,30)
   				setPlayerStorageValue(cid,6059,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 30 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6060 then
   		queststatus = getPlayerStorageValue(cid,6060)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 30 then
   				doPlayerSendTextMessage(cid,22,"You have found 20 platinum coins.")
			        doPlayerAddItem(cid,2152,20)
   				setPlayerStorageValue(cid,6060,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 30 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6061 then
   		queststatus = getPlayerStorageValue(cid,6061)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 30 then
   				doPlayerSendTextMessage(cid,22,"You have found 20 platinum coins.")
			        doPlayerAddItem(cid,2152,20)
   				setPlayerStorageValue(cid,6061,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 30 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6062 then
   		queststatus = getPlayerStorageValue(cid,6062)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 8 then
   				doPlayerSendTextMessage(cid,22,"You have found Scale Armor.")
			        doPlayerAddItem(cid,2483,1)
   				setPlayerStorageValue(cid,6062,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 8 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

 	elseif item.uid == 6063 then
   		queststatus = getPlayerStorageValue(cid,6063)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 8 then
   				doPlayerSendTextMessage(cid,22,"You have found Scale Armor.")
			        doPlayerAddItem(cid,2483,1)
   				setPlayerStorageValue(cid,6063,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 8 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- wand quest
 	elseif item.uid == 6064 then
   		queststatus = getPlayerStorageValue(cid,6019)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 8 then
   				doPlayerSendTextMessage(cid,22,"You have found Wand of Vortex and 30gp.")
			        doPlayerAddItem(cid,2190,1)
				doPlayerAddItem(cid,2148,30)
   				setPlayerStorageValue(cid,6019,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 8 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- rod quest
 	elseif item.uid == 6065 then
   		queststatus = getPlayerStorageValue(cid,6020)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 8 then
   				doPlayerSendTextMessage(cid,22,"You have found Snakebite Rod and 30gp.")
				doPlayerAddItem(cid,2148,30)
			        doPlayerAddItem(cid,2182,1)
   				setPlayerStorageValue(cid,6020,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 8 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end


	-- wand quest
 	elseif item.uid == 6066 then
   		queststatus = getPlayerStorageValue(cid,6019)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 8 then
   				doPlayerSendTextMessage(cid,22,"You have found Wand of Vortex and 30gp.")
			        doPlayerAddItem(cid,2190,1)
				doPlayerAddItem(cid,2148,30)
   				setPlayerStorageValue(cid,6019,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 8 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- rod quest
 	elseif item.uid == 6067 then
   		queststatus = getPlayerStorageValue(cid,6020)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 8 then
   				doPlayerSendTextMessage(cid,22,"You have found Snakebite Rod and 30gp.")
				doPlayerAddItem(cid,2148,30)
			        doPlayerAddItem(cid,2182,1)
   				setPlayerStorageValue(cid,6020,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 8 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- fs quest
 	elseif item.uid == 6068 then
   		queststatus = getPlayerStorageValue(cid,6068)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 35 then
   				doPlayerSendTextMessage(cid,22,"You have found Fire Sword and Guardian Shield.")
				doPlayerAddItem(cid,2392,30)
			        doPlayerAddItem(cid,2515,1)
   				setPlayerStorageValue(cid,6068,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 35 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- vorpal sword quest
 	elseif item.uid == 6069 then
   		queststatus = getPlayerStorageValue(cid,6069)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 35 then
   				doPlayerSendTextMessage(cid,22,"You have found Vorpal Blade.")
				doPlayerAddItem(cid,2438,1)
   				setPlayerStorageValue(cid,6069,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 35 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- demon quest (demon helmet)
 	elseif item.uid == 6070 then
   		queststatus = getPlayerStorageValue(cid,6070)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 99 then
   				doPlayerSendTextMessage(cid,22,"You have found Demon Helmet.")
				doPlayerAddItem(cid,2493,1)
   				setPlayerStorageValue(cid,6070,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 99 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- demon quest (steel boots)
 	elseif item.uid == 6071 then
   		queststatus = getPlayerStorageValue(cid,6071)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 99 then
   				doPlayerSendTextMessage(cid,22,"You have found Steel Boots.")
				doPlayerAddItem(cid,2645,1)
   				setPlayerStorageValue(cid,6071,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 99 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- demon quest (cc)
 	elseif item.uid == 6072 then
   		queststatus = getPlayerStorageValue(cid,6072)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 99 then
   				doPlayerSendTextMessage(cid,22,"You have found 3 Crystal Coins.")
				doPlayerAddItem(cid,2160,3)
   				setPlayerStorageValue(cid,6072,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 99 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- behemoth quest
 	elseif item.uid == 6073 then
   		queststatus = getPlayerStorageValue(cid,6073)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 65 then
   				doPlayerSendTextMessage(cid,22,"You have found Behemoth Suit.")
				doPlayerAddItem(cid,3968,1)
   				setPlayerStorageValue(cid,6073,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 65 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- phoenix quest
 	elseif item.uid == 6074 then
   		queststatus = getPlayerStorageValue(cid,6074)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 50 then
   				doPlayerSendTextMessage(cid,22,"You have found Phoenix Shield.")
				doPlayerAddItem(cid,2539,1)
   				setPlayerStorageValue(cid,6074,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 50 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- phoenix quest
 	elseif item.uid == 6075 then
   		queststatus = getPlayerStorageValue(cid,6075)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 50 then
   				doPlayerSendTextMessage(cid,22,"You have found Phoenix Shield.")
				doPlayerAddItem(cid,2539,1)
   				setPlayerStorageValue(cid,6075,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 50 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- lich quest
 	elseif item.uid == 6076 then
   		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 50 then
   				doPlayerSendTextMessage(cid,22,"You have found Crown Armor.")
				doPlayerAddItem(cid,24871)
   				setPlayerStorageValue(cid,6076,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 50 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- lich quest
 	elseif item.uid == 6077 then
   		queststatus = getPlayerStorageValue(cid,6077)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 50 then
   				doPlayerSendTextMessage(cid,22,"You have found Crown Legs.")
				doPlayerAddItem(cid,2488,1)
   				setPlayerStorageValue(cid,6077,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 50 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- lich quest
 	elseif item.uid == 6078 then
   		queststatus = getPlayerStorageValue(cid,6078)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 50 then
   				doPlayerSendTextMessage(cid,22,"You have found Vorpal Blade.")
				doPlayerAddItem(cid,2438,1)
   				setPlayerStorageValue(cid,6078,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 50 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- lich quest
 	elseif item.uid == 6079 then
   		queststatus = getPlayerStorageValue(cid,6079)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 50 then
   				doPlayerSendTextMessage(cid,22,"You have found Crystal Coin.")
				doPlayerAddItem(cid,2460,1)
   				setPlayerStorageValue(cid,6079,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 50 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- villa quest
 	elseif item.uid == 6080 then
   		queststatus = getPlayerStorageValue(cid,6080)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 12 then
   				doPlayerSendTextMessage(cid,22,"You have found a key.")
			        key = doPlayerAddItem(cid,2088,1)
    			        doSetItemActionId(key,3007)
   				setPlayerStorageValue(cid,6080,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 12 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- villa2 quest
 	elseif item.uid == 6080 then
   		queststatus = getPlayerStorageValue(cid,6080)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 12 then
   				doPlayerSendTextMessage(cid,22,"You have found a key.")
			        key = doPlayerAddItem(cid,2092,1)
    			        doSetItemActionId(key,3008)
   				setPlayerStorageValue(cid,6080,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 12 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- labbook quest
 	elseif item.uid == 6081 then
   		queststatus = getPlayerStorageValue(cid,6081)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 12 then
   				doPlayerSendTextMessage(cid,22,"You have found some books.")
			        book = doPlayerAddItem(cid,1975,1)
				doSetItemText(book, "Something is wrong.. I think that evil forces are in my cellar, I am scared to death. I am even scared to sleep without decend light. I heard many screams in my cellar; is this end? Or maybe mine damaged physics.. I don't know.")
			        book = doPlayerAddItem(cid,1975,1)
				doSetItemText(book, "I finished; I also teached it my Son, Falus. Though, my wife seen it so we have to kill her.")
			        book = doPlayerAddItem(cid,1975,1)
				doSetItemText(book, "Today I started to study Necromancy and Demonology. My main target is to summon a demon. Noone even tried it, but I do. If I fail, that will be end of Corlgan family. My wife said that i look supsocius but I don't care at this moment.")
			        book = doPlayerAddItem(cid,1975,1)
   				setPlayerStorageValue(cid,6081,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 12 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	-- horn quest
 	elseif item.uid == 6083 then
   		queststatus = getPlayerStorageValue(cid,6083)
   		if queststatus == -1 then
   			if getPlayerLevel(cid) >= 60 then
   				doPlayerSendTextMessage(cid,22,"You have found a Eyrie's Statue.")
			        doPlayerAddItem(cid,2141,1)
   				setPlayerStorageValue(cid,6083,1)
   			else
   				doPlayerSendTextMessage(cid,22,"You need level 60 to get prize.")
   			end
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	end
   	return 1
 end