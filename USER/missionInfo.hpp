/*
*   Legt allgemeine Information über die Mission fest.
*/

author = "nomisum für Gruppe Adler";                                               // Missionsersteller
onLoadName = "Operation Evening Light";                                                   // Name der Mission
onLoadMission = "";                                                             // Beschreibung der Mission (wird im Ladebildschirm unterhalb des Ladebildes angezeigt)
loadScreen = "data\loading.paa";                                                // Ladebild
overviewPicture = "";                                                           // Bild, das in der Missionsauswahl angezeigt wird
overviewText = "";                                                              // Text, der in der Missionsauswahl angezeigt wird


class CfgSFX
{
    sounds[] = {};

   
        
    class music1
    {
        name = "music1";
        sounds[]={sfxsound};
        sfxsound[]={"USER\sounds\music1.ogg",35,1,150,1,1,1,0};
        empty[]= {"",0,0,0,0,0,0,0};
    };

    class music2
    {
        name = "music2";
        sounds[]={sfxsound};
        sfxsound[]={"USER\sounds\music2.ogg",35,1,150,1,1,1,0};
        empty[]= {"",0,0,0,0,0,0,0};
    };

    class prayer2
    {
        name = "prayer2";
        sounds[]={sfxsound};
        sfxsound[]={"USER\sounds\prayer2.ogg",100,1,500,1,1,1,0};
        empty[]= {"",0,0,0,0,0,0,0};
    };    

    class arabtalking
    {
        name = "arab_talking";
        sounds[]={sfxsound};
        sfxsound[]={"USER\sounds\arab_talking.ogg",35,1,150,1,1,1,0};
        empty[]= {"",0,0,0,0,0,0,0};
    };

     class arabicsong1
    {
        name = "arabicsong1";
        sounds[]={sfxsound};
        sfxsound[]={"USER\sounds\arabicsong1.ogg",35,1,150,1,1,1,0};
        empty[]= {"",0,0,0,0,0,0,0};
    };
        
    class arabicsong2
    {
        name = "arabicsong2";
        sounds[]={sfxsound};
        sfxsound[]={"USER\sounds\arabicsong2.ogg",35,1,150,1,1,1,0};
        empty[]= {"",0,0,0,0,0,0,0};
    };
};

class CfgVehicles
{
  
    class music1 // class name to be used with createSoundSource
    {
        sound = "music1"; // reference to CfgSFX class
    };

    class music2 // class name to be used with createSoundSource
    {
        sound = "music2"; // reference to CfgSFX class
    };

  

    class prayer2 // class name to be used with createSoundSource
    {
        sound = "prayer2"; // reference to CfgSFX class
    };

 

    class arabtalking // class name to be used with createSoundSource
    {
        sound = "arabtalking"; // reference to CfgSFX class
    };

    class arabicsong1 // class name to be used with createSoundSource
    {
        sound = "arabicsong1"; // reference to CfgSFX class
    };

    class arabicsong2 // class name to be used with createSoundSource
    {
        sound = "arabicsong2"; // reference to CfgSFX class
    };

 


};