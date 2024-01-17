params ["_vehicle"];

removeAllWeapons _vehicle;
removeAllItems _vehicle;
removeAllAssignedItems _vehicle;
removeUniform _vehicle;
removeVest _vehicle;
removeBackpack _vehicle;
removeHeadgear _vehicle;
removeGoggles _vehicle;



_vehicle addMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m62_tracer", 20];
_vehicle addMagazineCargoGlobal ["rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote", 20];
_vehicle addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger_Tracer_Red", 50];

_vehicle addMagazineCargoGlobal ["rhs_ec75_mag", 10];


_vehicle addMagazineCargoGlobal ["HandGrenade", 10];
_vehicle addMagazineCargoGlobal ["SmokeShell", 10];
_vehicle addMagazineCargoGlobal ["SmokeShellGreen", 10];
_vehicle addMagazineCargoGlobal ["SmokeShellRed", 10];


_vehicle addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 20];
_vehicle addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", 20];
_vehicle addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", 20];

_vehicle addMagazineCargoGlobal ["ACE_40mm_Flare_red", 20];
_vehicle addMagazineCargoGlobal ["ACE_40mm_Flare_green", 20];
_vehicle addMagazineCargoGlobal ["ACE_40mm_Flare_white", 20];
_vehicle addMagazineCargoGlobal ["rhs_mag_M664_red_cluster", 20];
_vehicle addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 20];


_vehicle addMagazineCargoGlobal ["ACE_Chemlight_HiRed", 20];
_vehicle addMagazineCargoGlobal ["ACE_Chemlight_HiGreen", 20];
_vehicle addMagazineCargoGlobal ["ACE_Chemlight_HiWhite", 20];
_vehicle addMagazineCargoGlobal ["ACE_Chemlight_HiYellow", 20];
_vehicle addMagazineCargoGlobal ["ACE_Chemlight_HiBlue", 20];



_vehicle addWeaponCargoGlobal ["rhs_weap_M136", 2];

_vehicle addItemCargoGlobal ["ACE_entrenchingTool", 2];
_vehicle addItemCargoGlobal ["grad_axe", 2];
_vehicle addItemCargoGlobal ["ace_cabletie", 5];
_vehicle addItemCargoGlobal ["ace_bodybag", 5];

_vehicle addItemCargoGlobal ["ace_marker_flags_blue", 20];
_vehicle addItemCargoGlobal ["ace_marker_flags_green", 20];
_vehicle addItemCargoGlobal ["ace_marker_flags_yellow", 20];
_vehicle addItemCargoGlobal ["ace_marker_flags_red", 20];
_vehicle addItemCargoGlobal ["ace_marker_flags_white", 20];


