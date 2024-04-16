function onUse(cid, item, frompos, item2, topos)

a = {x=421, y=499, z=10}
b = {x=423, y=501, z=10}
c = {x=424, y=499, z=10}
d = {x=425, y=499, z=10}
e = {x=423, y=502, z=10}
f = {x=421, y=504, z=10}
g = {x=415, y=516, z=10}
h = {x=418, y=516, z=10}
i = {x=425, y=514, z=10}
j = {x=419, y=513, z=10}
k = {x=427, y=515, z=10}
l = {x=423, y=514, z=10}
playerpos = getPlayerPosition(cid)
m = {x=418, y=521, z=10}
n = {x=424, y=518, z=10}
o = {x=425, y=510, z=10}
p = {x=426, y=522, z=10}
q = {x=427, y=522, z=10}
r = {x=431, y=518, z=10}
s = {x=431, y=523, z=10}
t = {x=415, y=524, z=10}
u = {x=418, y=524, z=10}
v = {x=419, y=525, z=10}
x = {x=421, y=525, z=10}
y = {x=427, y=525, z=10}
z = {x=430, y=527, z=10}
aa = {x=416, y=527, z=10}
bb = {x=418, y=528, z=10}
cc = {x=415, y=530, z=10}
dd = {x=424, y=523, z=10}
ee = {x=430, y=529, z=10}
ff = {x=427, y=535, z=10}
gg = {x=423, y=531, z=10}
hh = {x=417, y=529, z=10}
ii = {x=415, y=529, z=10}
jj = {x=427, y=527, z=10}
kk = {x=419, y=529, z=10}
ll = {x=419, y=534, z=10}
mm = {x=421, y=534, z=10}
nn = {x=424, y=533, z=10}
oo = {x=424, y=530, z=10}
pp = {x=424, y=528, z=10}
qq = {x=427, y=532, z=10}
rr = {x=420, y=526, z=10}
ss = {x=428, y=535, z=10}
tt = {x=421, y=532, z=10}
uu = {x=416, y=528, z=10}
vv = {x=418, y=534, z=10}
xx = {x=430, y=528, z=10}
yy = {x=426, y=533, z=10}
zz = {x=417, y=523, z=10}
aaa = {x=423, y=530, z=10}
bbb = {x=419, y=534, z=10}
ccc = {x=425, y=530, z=10}
ddd = {x=428, y=526, z=10}
eee = {x=423, y=529, z=10}
fff = {x=427, y=528, z=10}
ggg = {x=423, y=533, z=10}
hhh = {x=425, y=533, z=10}

fire = {x=422, y=494, z=10}
poison = {x=423, y=494, z=10}
energy = {x=424, y=494, z=10}

stonie = {x=412, y=490, z=10}
stonie1 = {x=412, y=490, z=10, stackpos=1}
getstonie = getThingfromPos(stonie1)

   	if item.uid == 7057 and item.itemid == 1945 and getstonie.itemid ~= 1290 then
		player1pos = {x=423, y=491, z=10, stackpos=253}
		player1 = getThingfromPos(player1pos)

		if player1.itemid > 0 then
			queststatus1 = getPlayerStorageValue(player1.uid,2050)

			if queststatus1 == -1 then
				nplayer1pos = {x=423, y=496, z=10}

				doSendMagicEffect(player1pos,2)

				doTeleportThing(player1.uid,nplayer1pos,0)

				doSendMagicEffect(nplayer1pos,10)

				doSendMagicEffect(fire,15)
				doSendMagicEffect(poison,8)
				doSendMagicEffect(energy,11)

				doSummonCreature("Dragon",a)
				doSummonCreature("Demon",b)
				doSummonCreature("Black Knight",b)
				doSummonCreature("Black Knight",c)
				doSummonCreature("Dragon Lord",d)
				doSummonCreature("Dragon",e)
				doSummonCreature("Demon",f)
				doSummonCreature("Behemoth",g)
				doSummonCreature("Behemoth",h)
				doSummonCreature("Giant",i)
				doSummonCreature("Giant Spider",j)
				doSummonCreature("Giant Spider",k)
				doSummonCreature("Dragon Lord",l)
				doSummonCreature("Warlock",m)
				doSummonCreature("Demon",n)
				doSummonCreature("Dragon",o)
				doSummonCreature("Warlock",p)
				doSummonCreature("Black Knight",q)
				doSummonCreature("Hero",r)
				doSummonCreature("Giant Spider",s)
				doSummonCreature("Warlock",t)
				doSummonCreature("Giant",u)
				doSummonCreature("Warlock",v)
				doSummonCreature("Warlock",x)
				doSummonCreature("Dragon Lord",y)
				doSummonCreature("Black Knight",z)
				doSummonCreature("Black Knight",aa)
				doSummonCreature("Hero",bb)
				doSummonCreature("Giant Spider",cc)
				doSummonCreature("Giant Spider",dd)
				doSummonCreature("Warlock",ee)
				doSummonCreature("Hero",ff)
				doSummonCreature("Demon",gg)
				doSummonCreature("Demon",hh)
				doSummonCreature("Warlock",ii)
				doSummonCreature("Giant Spider",jj)
				doSummonCreature("Giant",kk)
				doSummonCreature("Giant Spider",ll)
				doSummonCreature("Behemoth",mm)
				doSummonCreature("Behemoth",nn)
				doSummonCreature("Behemoth",oo)
				doSummonCreature("Warlock",pp)
				doSummonCreature("Behemoth",qq)
				doSummonCreature("Giant Spider",rr)
				doSummonCreature("Giant Spider",ss)
				doSummonCreature("Giant Spider",tt)
				doSummonCreature("Giant Spider",uu)
				doSummonCreature("Warlock",vv)
				doSummonCreature("Warlock",xx)
				doSummonCreature("Warlock",yy)
				doSummonCreature("Giant",zz)
				doSummonCreature("Warlock",aaa)
				doSummonCreature("Dragon Lord",bbb)
				doSummonCreature("Dragon Lord",ccc)
				doSummonCreature("Demon",ddd)
				doSummonCreature("Demon",eee)
				doSummonCreature("Dragon Lord",fff)
				doSummonCreature("Dragon Lord",ggg)

				doCreateItem(426,1,player1pos)
        doCreateItem(1290,1,stonie)
        
				doTransformItem(item.uid,item.itemid+1)
			else
				doPlayerSendCancel(cid,"You have already done this quest.")
			end
		else
			doPlayerSendCancel(cid,"Impossible!")
		end

	elseif item.uid == 7057 and item.itemid == 1946 then
			doTransformItem(item.uid,item.itemid-1)
		
	elseif getstonie.itemid == 1290 and item.itemid == 1945 and queststatus1 == -1 then
    doSendMagicEffect(player1pos,2)

				doTeleportThing(player1.uid,nplayer1pos,o)
        doTransformItem(item.uid,item.itemid+1)
				doSendMagicEffect(nplayer1pos,10)
        doSendMagicEffect(playerpos,10)
				elseif queststatus == 1 then
				doCreatureSay(cid,"You are not longer welcome here.", 16)
	else
		return 0
	end

	return 1
end
