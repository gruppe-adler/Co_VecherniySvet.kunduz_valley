private _position1 = getPos introRabbits_1;
private _position2 = getPos introRabbits_2;
private _position3 = getPos introRabbits_3;
private _position4 = getPos introRabbits_4;

for "_i" from 1 to 7 do { 
	
	private _rabbit = createAgent ["Rabbit_F", _position1, [], 2, "NONE"];
	_rabbit setVariable ["BIS_fnc_animalBehaviour_disable", true];
	_rabbit setDir (60 + random 60);
	_rabbit playmovenow "Rabbit_Hop";

	_rabbit setSpeedMode "FULL";

	private _position2 = [[[_position2, 5]], []] call BIS_fnc_randomPos;
	_rabbit moveTo _position2;

};



for "_i" from 1 to 3 do { 
	
	private _rabbit = createAgent ["Rabbit_F", _position3, [], 2, "NONE"];
	_rabbit setVariable ["BIS_fnc_animalBehaviour_disable", true];
	_rabbit setDir (60 + random 60);
	_rabbit playmovenow "Rabbit_Hop";

	_rabbit setSpeedMode "FULL";

	private _position2 = [[[_position2, 5]], []] call BIS_fnc_randomPos;
	_rabbit moveTo _position2;

};

private _rabbit = createAgent ["Rabbit_F", _position4, [], 0, "CAN_COLLIDE"];
_rabbit setVariable ["BIS_fnc_animalBehaviour_disable", true];
_rabbit setDir 60;
_rabbit playmovenow "Rabbit_Idle_StopV1";