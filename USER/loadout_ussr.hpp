#ifdef NIGHTVISION
  #define NVITEM "NVGoggles_OPFOR"
#else
  #define NVITEM ""
#endif

#ifdef LASERS
  #define LLITEM "rhs_acc_perst1ik"
#else
  #define LLITEM ""
#endif

#ifdef GUNLIGHTS
  #define LLITEM "rhs_acc_2dpZenit"
#endif

#ifdef SUPPRESSORS
  #define SUPPRESSORITEM "rhs_acc_pbs1"
#else
  #define SUPPRESSORITEM "rhs_acc_dtk"
#endif

class grad_ussr: RUFlora {
    class AllUnits {
        uniform = "rhs_uniform_gorka_1_a";
        vest[] = {"UK3CB_ARD_B_V_6b5_Rifleman_Desert", "UK3CB_ARD_B_V_6b5_Desert"};
        backpack = "";
        headgear[] = {"rhs_altyn_novisor", "rhs_altyn_novisor_ess"};
        primaryWeapon = "rhs_weap_akm";
        primaryWeaponMagazine = "rhs_30Rnd_762x39mm_bakelite_tracer";
        // primaryWeaponMuzzle = SUPPRESSORITEM;
        primaryWeaponPointer = LLITEM;
        primaryWeaponOptics = "";
        primaryWeaponUnderbarrel = "";
		primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "";
        secondaryWeaponMagazine = "";
        handgunWeapon = "";
        handgunWeaponMagazine = "";
        binoculars = "Binocular";
        map = "ItemMap";
        compass = "ItemCompass";
        watch = "ItemWatch";
        gps = "ItemGPS";
        radio = "tfar_fadak";
		goggles[] = {"", "", "", "G_Bandanna_khk", "G_Bandanna_tan", "UK3CB_G_Bandanna_green_check", "UK3CB_G_Bandanna_brown_check", "G_Bandanna_blk"};
        nvgoggles = NVITEM;
    };
    class Type {
        //Rifleman
        class Soldier_F {
            addItemsToUniform[] = {
                LIST_1("ACE_MapTools"),
                LIST_1("ACE_DefusalKit"),
                LIST_2("ACE_CableTie"),
                LIST_1("ACE_Flashlight_KSF1"),

                GRAD_FACTIONS_MEDICITEMS_INF_LIST
            };
            addItemsToVest[] = {
                LIST_2("rhs_mag_rgd5"),
                LIST_2("rhs_mag_rdg2_white"),
                LIST_7("rhs_30Rnd_762x39mm_bakelite_tracer")
            };
        };

        //Asst. Autorifleman
        class Soldier_AAR_F: Soldier_F {
            backpack = "rhs_sidor";
            addItemsToBackpack[] = {
                LIST_2("rhs_100Rnd_762x54mmR_green")
            };
        };

        //Asst. Gunner (MMG) / Ammo Bearer
        class soldier_A_F: Soldier_AAR_F {};

        //Asst. Gunner (HMG/GMG)
        class support_AMG_F: Soldier_F {
            backpack = "RHS_Kord_Tripod_Bag";
        };

        //Asst. Missile Specialist (AA)
        class Soldier_AAA_F: Soldier_F {
            backpack = "rhs_rpg_empty";
            addItemsToBackpack[] = {
                LIST_1("rhs_mag_9k38_rocket")
            };
        };

        //Asst. Missile Specialist (AT)
        class Soldier_AAT_F: Soldier_F {
            backpack = "rhs_sidor";
            addItemsToBackpack[] = {
                LIST_2("rhs_rpg7_PG7VL_mag")
            };
        };

        //Autorifleman
        class Soldier_AR_F: Soldier_F {
            primaryWeapon = "rhs_weap_pkm";
            primaryWeaponMagazine = "rhs_100Rnd_762x54mmR_7N26";
            primaryWeaponMuzzle = "";
            primaryWeaponPointer = "";
            backpack = "rhs_sidor";
            addItemsToBackpack[] = {
                LIST_2("rhs_100Rnd_762x54mmR_green")
            };
            addItemsToVest[] = {
                LIST_1("rhs_100Rnd_762x54mmR_green"),
                LIST_2("rhs_mag_rgd5"),
                LIST_2("rhs_mag_rdg2_white")
            };
        };

        //Combat Life Saver
        class medic_F: Soldier_F {
            handgunWeapon = "";
            handgunWeaponMagazine = "";
            vest = "UK3CB_ARD_B_V_6b5_Medic_Desert";
            backpack = "UK3CB_KDF_B_B_Sidor_MD_OLI";
            addItemsToUniform[] = {
                "ACE_MapTools",
                LIST_2("ACE_CableTie"),
                "ACE_Flashlight_KSF1"
            };
            class Rank {
                class PRIVATE {
                    GRAD_FACTIONS_MEDICITEMS_PT
                };
                class CORPORAL {
                    GRAD_FACTIONS_MEDICITEMS_PT
                };
                class SERGEANT {
                    GRAD_FACTIONS_MEDICITEMS_PT
                };
                class LIEUTENANT: SERGEANT {};
                class CAPTAIN: SERGEANT {};
                class MAJOR: SERGEANT {};
                class COLONEL: SERGEANT {};
            };
        };

        //Explosive Specialist
        class Soldier_exp_F: Soldier_F {
            backpack = "rhs_sidor_engineer_empty";
            addItemsToBackpack[] = {
                "ACE_Clacker",
                "ACE_M26_Clacker",
                "ACE_DefusalKit",
                "SatchelCharge_Remote_Mag",
                LIST_2("DemoCharge_Remote_Mag")
            };
        };

        //Grenadier
        class Soldier_GL_F: Soldier_F {
            primaryWeapon = "rhs_weap_akm_gp25";
            primaryWeaponPointer = "";
            vest = "UK3CB_ARD_B_V_6b5_Sniper_Desert";
            backpack = "rhs_sidor";
            addItemsToBackpack[] = {
                LIST_2("rhs_mag_rgd5"),
                LIST_2("rhs_mag_rdg2_white"),
                LIST_6("rhs_VOG25"),
                LIST_2("rhs_VG40MD_White"),
                LIST_2("rhs_VG40MD_Green"),
                LIST_2("rhs_VG40MD_Red")
            };
        };

        //Heavy Gunner (MMG)
        class HeavyGunner_F: Soldier_AR_F {};

        //Gunner (HMG/GMG)
        class support_MG_F: Soldier_F {
            backpack = "RHS_Kord_Gun_Bag";
        };

        //Marksman
        class Soldier_M_F: Soldier_F {
            primaryWeapon = "rhs_weap_svdp";
            primaryWeaponMagazine = "rhs_10Rnd_762x54mmR_7N1";
            primaryWeaponOptics = "rhs_acc_pso1m21";
            primaryWeaponPointer = "";
            primaryWeaponMuzzle = "";
            addItemsToVest[] = {
                LIST_2("rhs_mag_rgd5"),
                "rhs_mag_rdg2_white",
                LIST_10("rhs_10Rnd_762x54mmR_7N1")
            };
        };

        //Missile Specialist (AA)
        class Soldier_AA_F: Soldier_F {
            secondaryWeapon = "rhs_weap_igla";
            secondaryWeaponMagazine = "rhs_mag_9k38_rocket";
            backpack = "rhs_rpg_empty";
            addItemsToBackpack[] = {
                "rhs_mag_9k38_rocket"
            };
        };

        //Missile Specialist (AT)
        class Soldier_AT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_rpg7";
            secondaryWeaponMagazine = "rhs_rpg7_PG7VL_mag";
            backpack = "rhs_rpg_empty";
            addItemsToBackpack[] = {
                LIST_2("rhs_rpg7_PG7VL_mag"),
                "rhs_rpg7_OG7V_mag"
            };
        };

        //Repair Specialist
        class Soldier_repair_F: Soldier_F {
            headgear = "rhs_6b26_ess";
            backpack = "rhs_sidor_engineer_empty";
            addItemsToBackpack[] = {
                "ToolKit",
                "ACE_wirecutter"
            };
        };

        //Rifleman (AT)
        class Soldier_LAT_F: Soldier_F {
            secondaryWeapon = "rhs_weap_rpg26";
            headgear = "rhs_6b26_bala";
        };

        //Helicrew
        class helicrew_F: Soldier_F {
            primaryWeapon = "rhs_weap_aks74";
            vest = "rhs_lifchik";
            uniform = "UK3CB_CW_SOV_O_LATE_U_H_Pilot_Uniform_01_TTSKO";
            headgear = "rhs_zsh7a_mike";
        };

         //HeliPilot
        class helipilot_F: helicrew_F {
            headgear = "rhs_zsh7a_mike_alt";
        };

        //Sniper
        class Sniper_F: Soldier_F {
            primaryWeapon = "rhs_weap_t5000";
            primaryWeaponMagazine = "rhs_5Rnd_338lapua_t5000";
            primaryWeaponOptics = "rhs_acc_dh520x56";
            primaryWeaponUnderbarrel = "rhs_acc_harris_swivel";
            primaryWeaponMuzzle = "";
            primaryWeaponPointer = "";
            vest = "UK3CB_ARD_B_V_6b5_Sniper_Desert";
            headgear = "rhs_Booniehat_flora";
            binoculars = "rhs_pdu4";
            addItemsToVest[] = {
                LIST_2("rhs_mag_rdg2_white"),
                LIST_19("rhs_5Rnd_338lapua_t5000")
            };
            addItemsToUniform[] = {
                "ACE_MapTools",
                "ACE_EarPlugs",
                LIST_2("rhs_mag_9x18_8_57N181S"),
                LIST_2("ACE_CableTie"),
                LIST_8("ACE_fieldDressing"),
                LIST_4("ACE_morphine"),
                "ACE_epinephrine",
                "ACE_Flashlight_KSF1",
                "ACE_RangeCard"
            };
        };

        //Squad Leader
        class Soldier_SL_F: Soldier_F {
            primaryWeapon = "rhs_weap_akm_gp25";
			vest = "UK3CB_ARD_B_V_6b5_Officer_Desert";
            primaryWeaponPointer = "";
            backpack = "tfar_mr3000_rhs";
            headgear = "rhs_6b26_ess";
            addItemsToBackpack[] = {
                LIST_2("rhs_mag_rdg2_white"),
                LIST_4("rhs_VG40MD_Green"),
                LIST_4("rhs_VG40MD_Red"),
                LIST_4("rhs_VG40MD_White")
            };
        };

		//RTO
		class soldier_UAV_F: Soldier_SL_F {
		};

        //Spotter
        class Spotter_F: Soldier_F {
            binoculars = "rhs_pdu4";
            headgear = "rhs_Booniehat_flora";
            backpack = "rhs_sidor";
            addItemsToUniform[] = {
                "ACE_MapTools",
                "ACE_EarPlugs",
                "ACE_ATragMX",
                "ACE_Kestrel4500",
                "ACE_RangeCard",
                LIST_2("rhs_mag_9x18_8_57N181S"),
                LIST_2("ACE_CableTie"),
                LIST_8("ACE_fieldDressing"),
                LIST_4("ACE_morphine"),
                "ACE_epinephrine",
                "ACE_Flashlight_KSF1"
            };
            addItemsToBackpack[] = {
                "ACE_Tripod",
                "ACE_SpottingScope"
            };
        };

        class Officer_F: Soldier_F {
            uniform = "UK3CB_CW_SOV_O_Early_U_OFFICER_Uniform_01_KHK";
            headgear = "UK3CB_CW_SOV_O_LATE_H_Officer_Cap";
            vest = "";
            map = "ItemMap";
            compass = "ItemCompass";
            watch = "ItemWatch";
            gps = "itemgps";
            radio = "tfar_fadak";
            nvgoggles = "";
        };

        //Team Leader
        class Soldier_TL_F: Soldier_SL_F {
            backpack[] = {"rhs_sidor", "UK3CB_CW_SOV_O_EARLY_B_Sidor_RIF", "UK3CB_CW_SOV_O_LATE_B_Sidor_RIF"};
            addItemsToBackpack[] = {
                LIST_2("rhs_mag_rdg2_white"),
                LIST_2("rhs_VG40MD_Green"),
                LIST_2("rhs_VG40MD_Red"),
                LIST_2("rhs_VG40MD_White"),
                LIST_4("rhs_VOG25")
            };
        };
    };
    class Rank {
        class LIEUTENANT {
            headgear = "rhs_fieldcap_vsr";
        };
    };
};
