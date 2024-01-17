params ["_car"];

private _waypoints = waypoints _car;
private _path = [];
{
  _path pushbackUnique (waypointPosition _x);
} forEach _waypoints;

_car setDriveOnPath _path;