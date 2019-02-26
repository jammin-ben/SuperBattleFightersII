//normalize angle
if angle >=360
	angle -=360
if angle < 0
	angle+=360

if abs(angle-dir) > turnSpeed*dt {
	if (dir>angle and dir - angle <= 180) or (angle>dir and angle-dir>180){
		angle += turnSpeed*dt
	}
	else{
		angle = angle-turnSpeed*dt
	}
}
else
	angle = dir
	
//show_debug_message(angle)