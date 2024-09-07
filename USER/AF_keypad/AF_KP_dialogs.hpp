class AF_KeyPad
{
	idd=-1;
	movingenable=false;

	onUnload = "[this] call grad_af_keypad_fnc_setNotInUse;";
	class controls 
	{
		class AF_KeyPad_Frame: RscFrame
		{
			idc = 1800;
			x = 0.438745 * safezoneW + safezoneX;
			y = 0.177928 * safezoneH + safezoneY;
			w = 0.262522 * safezoneW;
			h = 0.476106 * safezoneH;
		};
		class AF_KeyPad_Box: BOX
		{
			idc = -1;
			x = 0.438745 * safezoneW + safezoneX;
			y = 0.177928 * safezoneH + safezoneY;
			w = 0.262522 * safezoneW;
			h = 0.476106 * safezoneH;
		};
		class AF_KeyPad_Display: RscText
		{
			idc = 1000;
			text = "Enter Keycode"; //--- ToDo: Localize;
			x = 0.456246 * safezoneW + safezoneX;
			y = 0.191931 * safezoneH + safezoneY;
			w = 0.227519 * safezoneW;
			h = 0.0840187 * safezoneH;
		};
		class AF_Key1: RscButton
		{
			idc = 1600;
			text = "1"; //--- ToDo: Localize;
			x = 0.456246 * safezoneW + safezoneX;
			y = 0.303956 * safezoneH + safezoneY;
			w = 0.0700059 * safezoneW;
			h = 0.0700156 * safezoneH;
			Action = "[""number"", 1] call grad_af_keypad_fnc_fncs;";
		};
		class AF_Key2: RscButton
		{
			idc = 1601;
			text = "2"; //--- ToDo: Localize;
			x = 0.535003 * safezoneW + safezoneX;
			y = 0.303956 * safezoneH + safezoneY;
			w = 0.0700059 * safezoneW;
			h = 0.0700156 * safezoneH;
			Action = "[""number"", 2] call grad_af_keypad_fnc_fncs;";
		};
		class AF_Key3: RscButton
		{
			idc = 1602;
			text = "3"; //--- ToDo: Localize;
			x = 0.61376 * safezoneW + safezoneX;
			y = 0.303956 * safezoneH + safezoneY;
			w = 0.0700059 * safezoneW;
			h = 0.0700156 * safezoneH;
			Action = "[""number"", 3] call grad_af_keypad_fnc_fncs;";
		};
		class AF_Key4: RscButton
		{
			idc = 1603;
			text = "4"; //--- ToDo: Localize;
			x = 0.456246 * safezoneW + safezoneX;
			y = 0.387975 * safezoneH + safezoneY;
			w = 0.0700059 * safezoneW;
			h = 0.0700156 * safezoneH;
			Action = "[""number"", 4] call grad_af_keypad_fnc_fncs;";
		};
		class AF_Key5: RscButton
		{
			idc = 1604;
			text = "5"; //--- ToDo: Localize;
			x = 0.535003 * safezoneW + safezoneX;
			y = 0.387975 * safezoneH + safezoneY;
			w = 0.0700059 * safezoneW;
			h = 0.0700156 * safezoneH;
			Action = "[""number"", 5] call grad_af_keypad_fnc_fncs;";
		};
		class AF_Key6: RscButton
		{
			idc = 1605;
			text = "6"; //--- ToDo: Localize;
			x = 0.61376 * safezoneW + safezoneX;
			y = 0.387975 * safezoneH + safezoneY;
			w = 0.0700059 * safezoneW;
			h = 0.0700156 * safezoneH;
			Action = "[""number"", 6] call grad_af_keypad_fnc_fncs;";
		};
		class AF_Key7: RscButton
		{
			idc = 1606;
			text = "7"; //--- ToDo: Localize;
			x = 0.456246 * safezoneW + safezoneX;
			y = 0.471994 * safezoneH + safezoneY;
			w = 0.0700059 * safezoneW;
			h = 0.0700156 * safezoneH;
			Action = "[""number"", 7] call grad_af_keypad_fnc_fncs;";
		};
		class AF_Key8: RscButton
		{
			idc = 1607;
			text = "8"; //--- ToDo: Localize;
			x = 0.535003 * safezoneW + safezoneX;
			y = 0.471994 * safezoneH + safezoneY;
			w = 0.0700059 * safezoneW;
			h = 0.0700156 * safezoneH;
			Action = "[""number"", 8] call grad_af_keypad_fnc_fncs;";
		};
		class AF_Key9: RscButton
		{
			idc = 1608;
			text = "9"; //--- ToDo: Localize;
			x = 0.61376 * safezoneW + safezoneX;
			y = 0.471994 * safezoneH + safezoneY;
			w = 0.0700059 * safezoneW;
			h = 0.0700156 * safezoneH;
			Action = "[""number"", 9] call grad_af_keypad_fnc_fncs;";
		};
		class AF_Key_Clear: RscButton
		{
			idc = 1609;
			text = "Clear"; //--- ToDo: Localize;
			x = 0.456246 * safezoneW + safezoneX;
			y = 0.556012 * safezoneH + safezoneY;
			w = 0.0700059 * safezoneW;
			h = 0.0700156 * safezoneH;
			Action = "[""clear"", 0] call grad_af_keypad_fnc_fncs;";
		};
		class AF_Key0: RscButton
		{
			idc = 1610;
			text = "0"; //--- ToDo: Localize;
			x = 0.535003 * safezoneW + safezoneX;
			y = 0.556012 * safezoneH + safezoneY;
			w = 0.0700059 * safezoneW;
			h = 0.0700156 * safezoneH;
			Action = "[""number"", 0] call grad_af_keypad_fnc_fncs;";
		};
		class AF_Key_Enter: RscButton
		{
			idc = 1611;
			text = "Enter"; //--- ToDo: Localize;
			x = 0.61376 * safezoneW + safezoneX;
			y = 0.556012 * safezoneH + safezoneY;
			w = 0.0700059 * safezoneW;
			h = 0.0700156 * safezoneH;
			Action = "[""enter"", 0] call grad_af_keypad_fnc_fncs;";
		};
	
	};
};