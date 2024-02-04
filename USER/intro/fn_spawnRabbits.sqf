private _position1 = getPos introRabbits_1;
private _position2 = getPos introRabbits_2;

for "_i" from 1 to 10 do { 
	
	private _rabbit = createAgent ["Rabbit_F", _position1, [], 2, "NONE"];
	_rabbit setVariable ["BIS_fnc_animalBehaviour_disable", true];
	_rabbit setDir (60 + random 60);
	_rabbit playmovenow "Rabbit_Hop";

	_rabbit setSpeedMode "FULL";

	private _position2 = [[[_position2, 5]], []] call BIS_fnc_randomPos;
	_rabbit moveTo _position2;

};
