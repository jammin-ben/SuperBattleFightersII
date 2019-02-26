Speed = 200
dir   = 0
angle=0
turnSpeed = 120
image_xscale=3
image_yscale=3
curr_animation=[0,1]
free = true
arm = 1 //1 represents right arm. -1 represents left arm
hp = 6
invincible=false
iFrames=35
col=c_white
knockbackVel = [0,0]

upkey=ord("W")
downkey=ord("S")
leftkey=ord("A")
rightkey=ord("D")
punchkey=ord("E")

//Init array of enemy ids
var i;
var idx = 0; 
for (i = 0; i < instance_number(Player); i += 1)
   {
	if(instance_find(Player,i)!=self){
	   enemies[idx] = instance_find(Player,i);
	   idx+=1
	}
   }
  
show_debug_message(enemies)