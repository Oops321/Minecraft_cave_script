

cave={}
cave.imgpath={"gfx/Oops321/tiles/Minecraft/stone.png"}
cave.img={}
cave.img.id={}
cave.pl={}
cave.x={0,26*32}
cave.y={0,15*32}
for id=1,32 do
cave.pl[id]=0;
end

X,Y=48,48
xMax=26
yMax=15
i=0
for x=1,xMax do
	for y=1,yMax do
	i=i+1
	table.insert(cave.img.id,image(cave.imgpath[1],X,Y,1))
	Y=Y+32
	end
	Y=48
	X=X+32
	print("\169230230230Number of Cave image : "..i)
end



addhook("move","cave.move")
function cave.move(id,x,y)
	if (player(id,"x")>=cave.x[1] and player(id,"x")<=cave.x[2]) and (player(id,"x")>=cave.y[1] and player(id,"y")<=cave.y[2]) then
		if cave.pl[id]==0 then
			for i=1,#cave.img.id do
			tween_alpha(cave.img.id[i],200,0.3)
			end
		cave.pl[id]=1
		end
	else
		if cave.pl[id]==1 then
			for i=1,#cave.img.id do
			tween_alpha(cave.img.id[i],200,1.0)
			end
		cave.pl[id]=0
		end
	end
end
