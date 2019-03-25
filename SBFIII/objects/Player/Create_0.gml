maxSpeed= 225
Speed = maxSpeed
dir   = 0
angle = 0
turnSpeed = 200
charging=false
image_xscale=3
image_yscale=3
curr_animation=[0,1]
free = true
depth = 150
arm = 1 //1 represents right arm. -1 represents left arm
maxHp=4
hp = maxHp
invincible=false
iFrames=1*room_speed
col=c_white
knockbackVel = [0,0]
team=1 //Currently only used for drawing heart sprites
knockbackPower=1000
knockbackFriction=.9
spr=minotaur_s
canCharge=true
xvel = 0
yvel = 0

upkey=ord("W")
downkey=ord("S")
leftkey=ord("A")
rightkey=ord("D")
punchkey=ord("E")
chargekey=ord("Q")

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