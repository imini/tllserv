function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,3902) == -1 then
	if getPlayerFreeCap(cid) < 10 then
	doPlayerSendTextMessage(cid,22,"You have found a book that weighs 10 oz. You don't have enough cap.")	
	else
	setPlayerStorageValue(cid,3902,1)
	rrr = doPlayerAddItem(cid,6103,1)
	doPlayerSendTextMessage(cid,22,"You have found the book of Lithaton.")
	doSetItemActionId(rrr,3430)
doSetItemText(rrr,"A chronicle of war                                     shall be sought                                           letter by letter                                             the Riddle be fought                                                                                                                 3-3-3, 2-5-6, 1-5-2                                 3-14-3, 2-5-4, 2-2-8, 2-5-4, 9-3-1,  5-7-2                                                              3-3-3, 9-3-1                                                  2-2-8, 1-5-2, 1-5-2                                      3-3-3, 2-5-6, 1-5-2                                     3-3-3, 2-2-5, 1-5-2, 1-1-4, 2-2-8,       3-3-4, 2-2-5, 1-5-2                                   8-3-5, 1-1-4, 3-3-3, 2-5-6                                                                                                    4-4-1, 1-1-4, 5-7-2                                   9-3-1, 5-7-2, 6-5-7, 5-3-3                       4-13-1, 1-5-2                                                2-2-8, 1-5-2, 1-5-2,  5-7-2                   9-3-1, 5-7-2                                                 3-3-3, 2-5-4, 6-5-2, 1-5-2                      3-3-3, 2-5-6, 2-2-5, 9-3-1, 3-3-4,    2-2-1, 2-5-6                                               2-2-1, 6-5-7, 1-1-4, 2-2-8, 2-2-8                                                                                    3-3-3, 2-5-6, 1-5-2                                   1-1-4, 2-2-5, 4-4-1, 2-5-6, 1-5-2,      2-2-5, 2-2-8                                                 9-3-1, 3-7-2                                                   3-3-3, 2-5-6, 1-5-2                                  1-5-2, 3-3-3, 1-5-2, 2-2-5, 5-7-2,      1-1-4, 6-5-7                                                   2-2-8, 1-1-4, 5-7-2, 7-10-5                                                                                                   1-5-2, 5-7-2, 4-4-1, 6-5-7, 9-3-1,      2-2-8, 1-5-2, 7-10-5                                   3-3-3, 2-5-6, 1-5-2                                    2-2-8, 1-5-2, 4-4-1, 2-2-5, 1-5-2,       3-3-3                                                             7-2-1, 2-5-4, 3-3-3, 2-5-6                      4-4-1, 2-2-5, 5-3-3, 2-2-8, 3-3-3,      1-1-4, 6-5-7                                                  2-5-6, 1-1-4, 5-7-2, 7-10-5")

	end
else
doPlayerSendTextMessage(cid,22,"You have already taken the book.")
end
return 1
end
