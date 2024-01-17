/*
*   Hier können eigene Funktionen eingebunden werden.
*   Ist in CfgFunctions included.
*/

#include "commandvehicle\cfgFunctions.hpp"
#include "caves\cfgFunctions.hpp"
#include "captive\cfgFunctions.hpp"
#include "intro\cfgFunctions.hpp"
#include "zeusmodules\cfgFunctions.hpp"
#include "ambient\cfgFunctions.hpp"

class GRAD_SilentRain {
	tag = "grad_SR";
	
	#include "functions\hooker\cfgFunctions.hpp"
	#include "functions\custominteractions\CfgFunctions.hpp"
	#include "functions\defuseStickHandling\CfgFunctions.hpp"
	#include "functions\powerline\cfgFunctions.hpp"

};
