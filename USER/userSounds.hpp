/*
*   Hier können eigene Sounds eingebunden werden.
*   Ist in CfgSounds included.
*/

#define VOLUME 4
#define DISTANCE 15

#include "grad_interrogation\cfgSounds.hpp"

class phoneRing1
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "phoneRing1";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\phoneRing1.ogg", 2, 1, DISTANCE };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};


class phoneRing2
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "phoneRing2";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\phoneRing2.ogg", 2, 1, DISTANCE };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};


class garble_long
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "garble_long";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\garble_long.ogg", 2, 1, DISTANCE };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class drill
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "drill";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\drill.ogg", 2, 1, DISTANCE };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};


class impact_bird
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "impact_bird";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\impact_bird.ogg", VOLUME, 1, DISTANCE };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class rocksFalling_1
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "rocksFalling_1";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\rocksFalling_1.ogg", VOLUME, 1, DISTANCE };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class rocksFalling_2
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "rocksFalling_2";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\rocksFalling_2.ogg", VOLUME, 1, DISTANCE };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class rocksFalling_3
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "rocksFalling_3";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\rocksFalling_3.ogg", VOLUME, 1, DISTANCE };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};

class rocksFalling_4
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "rocksFalling_4";
    // filename, volume, pitch, distance (optional)
    sound[] = { "USER\sounds\rocksFalling_4.ogg", VOLUME, 1, DISTANCE };
    // subtitle delay in seconds, subtitle text
    titles[] = {  };
};



class buzz
{
    name = "buzz";
    sound[] = {"USER\sounds\buzz.ogg", 1, 1, 50};
    titles[] = {0,""};
};
