// Start Customizable zone:

// Specify how many monsters can live at once per squadmaker. less number = more server fps but less funny
string MaxMonstersAtTime = 20;

// End of customizable zone.


// Start of suggestions place:
/*
	SUGGESTIONS:

	-
	-
	-
	-
	-
	-
	-
	
	CTRL+F "-TODO" for things that i want to implement. they're noted so i do not forget it.

*/
// End of suggestions place.




// Start of including things

// Resurrect players each round and keep their weapons and ammo.
#include "respawndead_keepweapons"

// Purchase zone
#include "mikk/entities/utils"
#include "mikk/entities/purchase_zone"

// Multi-Language texts
#include "multi_language/multi_language"

// you can disable. it just help during testing
#include "mikk/entities/game_debug"

// Custom zombie by DrAbcrealone & Goodman3
#include "mikk/npc/npc_zombie"

// -TODO organice the arrays for make them give same category weapons for purchase zone.
// Weapons pack and STARTS OF THE MESS!!!
const array<string> ArrayPackNative =
{
	"weapon_crowbar",
	"weapon_glock",
	"weapon_medkit",
	"weapon_grapple",
	"weapon_pipewrench",
	"weapon_357",
	"weapon_eagle",
	"weapon_9mmAR",
	"weapon_m16",
	"weapon_shotgun",
	"weapon_crossbow",
	"weapon_rpg",
	"weapon_gauss",
	"weapon_egon",
	"weapon_hgun",
	"weapon_snark",
	"weapon_displacer",
	"weapon_sniperrifle",
	"weapon_m249",
	"weapon_sporelauncher",
	"weapon_shockrifle",
	"weapon_minigun",
	"weapon_uzi",
	"weapon_uziakimbo",
	"weapon_handgrenade",
	"weapon_satchel",
	"weapon_tripmine"
};
#include "cof/smgs/weapon_cofm76"
#include "cof/melee/weapon_cofaxe"
#include "cof/rifles/weapon_cofak74"
#include "cof/pistols/weapon_cofdeagle"
#include "cof/pistols/weapon_cofanaconda"
#include "cof/pistols/weapon_cofberetta"
#include "cof/pistols/weapon_cofglock18"
#include "cof/pistols/weapon_cofp228"
#include "cof/melee/weapon_cofhammer"
#include "cof/melee/weapon_cofspear"
#include "cof/smgs/weapon_cofmp5k"
#include "cof/smgs/weapon_cofuzi"
#include "cof/shotguns/weapon_cofbenelli"
#include "cof/rifles/weapon_cofl85"
#include "cof/special/weapon_cofgolden"
#include "cof/melee/weapon_cofknife"
const array<string> ArrayPackAoMDC =
{
	"weapon_cofknife",
	"weapon_cofp228",
	"weapon_medkit",
	"weapon_cofspear",
	"weapon_cofhammer",
	"weapon_cofglock18",
	"weapon_cofdeagle",
	"weapon_cofmp5k",
	"weapon_cofak74",
	"weapon_cofbenelli",
	"weapon_cofl85",
	"weapon_cofaxe",
	"weapon_cofanaconda",
	"weapon_cofm76",
	"weapon_cofuzi",
	"weapon_cofgolden",
	"weapon_cofberetta"
};
const bool p_Customizable = true; // Needed to define custom/default ammo (-( I don't know for what it is used but i've included just in case )-)
#include "cof/melee/weapon_cofswitchblade"
#include "cof/melee/weapon_cofbranch"
#include "cof/melee/weapon_cofnightstick"
#include "cof/melee/weapon_cofsledgehammer"
#include "cof/pistols/weapon_cofglock"
#include "cof/pistols/weapon_cofp345"
#include "cof/pistols/weapon_cofrevolver"
#include "cof/pistols/weapon_cofvp70"
#include "cof/smgs/weapon_coftmp"
#include "cof/smgs/weapon_cofmp5"
#include "cof/shotguns/weapon_cofshotgun"
#include "cof/rifles/weapon_cofg43"
#include "cof/rifles/weapon_cofm16"
#include "cof/rifles/weapon_cofrifle"
#include "cof/rifles/weapon_coffamas"
#include "cof/special/weapon_cofcamera"
#include "cof/special/weapon_cofbooklaser"
const array<string> ArrayPackCoF =
{
	"weapon_cofswitchblade",
	"weapon_cofglock",
	"weapon_medkit",
	"weapon_cofbranch",
	"weapon_cofnightstick",
	"weapon_cofrevolver",
	"weapon_cofp345",
	"weapon_cofmp5",
	"weapon_coftmp",
	"weapon_cofshotgun",
	"weapon_cofg43",
	"weapon_cofm16",
	"weapon_coffamas",
	"weapon_cofsledgehammer",
	"weapon_cofrifle",
	"weapon_cofcamera",
	"weapon_cofbooklaser",
	"weapon_cofvp70"
};
#include "cs16/melee/weapon_csknife"
#include "cs16/pist/weapon_csglock18"
#include "cs16/pist/weapon_usp"
#include "cs16/pist/weapon_p228"
#include "cs16/pist/weapon_fiveseven"
#include "cs16/pist/weapon_dualelites"
#include "cs16/pist/weapon_csdeagle"
#include "cs16/shot/weapon_m3"
#include "cs16/shot/weapon_xm1014"
#include "cs16/smg/weapon_mac10"
#include "cs16/smg/weapon_tmp"
#include "cs16/smg/weapon_mp5navy"
#include "cs16/smg/weapon_ump45"
#include "cs16/smg/weapon_p90"
#include "cs16/misc/weapon_hegrenade"
#include "cs16/misc/weapon_c4"
#include "cs16/rifl/weapon_famas"
#include "cs16/rifl/weapon_galil"
#include "cs16/rifl/weapon_ak47"
#include "cs16/rifl/weapon_m4a1"
#include "cs16/rifl/weapon_aug"
#include "cs16/rifl/weapon_sg552"
#include "cs16/snip/weapon_scout"
#include "cs16/snip/weapon_awp"
#include "cs16/snip/weapon_sg550"
#include "cs16/snip/weapon_g3sg1"
#include "cs16/lmg/weapon_csm249"
const array<string> ArrayPackCs16 =
{
	"weapon_csknife",
	"weapon_usp",
	"weapon_medkit",
	"weapon_csglock18",
	"weapon_p228",
	"weapon_fiveseven",
	"weapon_dualelites",
	"weapon_csdeagle",
	"weapon_m3",
	"weapon_xm1014",
	"weapon_mac10",
	"weapon_tmp",
	"weapon_mp5navy",
	"weapon_ump45",
	"weapon_p90",
	"weapon_hegrenade",
	"weapon_ak47",
	"weapon_galil",
	"weapon_famas",
	"weapon_m4a1",
	"weapon_aug",
	"weapon_sg552",
	"weapon_scout",
	"weapon_awp",
	"weapon_sg550",
	"weapon_c4",
	"weapon_g3sg1",
	"weapon_csm249"
};
#include "ins2/melee/weapon_ins2kukri"
#include "ins2/handg/weapon_ins2makarov"
#include "ins2/arifl/weapon_ins2asval"
#include "ins2/smg/weapon_ins2m1928"
#include "ins2/brifl/weapon_ins2fg42"
#include "ins2/rifle/weapon_ins2garand"
#include "ins2/rifle/weapon_ins2kar98k"
#include "ins2/rifle/weapon_ins2enfield"
#include "ins2/explo/weapon_ins2stick"
#include "ins2/explo/weapon_ins2rpg7"
#include "ins2/lmg/weapon_ins2lewis"
#include "ins2/lmg/weapon_ins2rpk"
#include "ins2/handg/weapon_ins2m1911"
#include "ins2/carbn/weapon_ins2c96carb"
#include "ins2/handg/weapon_ins2c96"
#include "ins2/srifl/weapon_ins2mosin"
#include "ins2/srifl/weapon_ins2g43"
#include "ins2/smg/weapon_ins2mp40"
#include "ins2/carbn/weapon_ins2m1a1para"
#include "ins2/smg/weapon_ins2ppsh41" // Fucking sweet weapon
#include "ins2/smg/weapon_ins2l2a3"
#include "ins2/smg/weapon_ins2mp18"
#include "ins2/explo/weapon_ins2pzfaust"
const array<string> ArrayPackIns2WW2 =
{
	"weapon_ins2kukri",
	"weapon_ins2makarov",
	"weapon_medkit",
	"weapon_ins2asval",
	"weapon_ins2m1928",
	"weapon_ins2fg42",
	"weapon_ins2garand",
	"weapon_ins2kar98k",
	"weapon_ins2enfield",
	"weapon_ins2stick",
	"weapon_ins2rpg7",
	"weapon_ins2lewis",
	"weapon_ins2rpk",
	"weapon_ins2m1911",
	"weapon_ins2c96",
	"weapon_ins2mosin",
	"weapon_ins2g43",
	"weapon_ins2m1a1para",
	"weapon_ins2c96carb",
	"weapon_ins2mp40",
	"weapon_ins2ppsh41",
	"weapon_ins2l2a3",
	"weapon_ins2mp18",
	"weapon_ins2pzfaust"
};
#include "ins2/melee/weapon_ins2kabar"
#include "ins2/handg/weapon_ins2usp"
#include "ins2/arifl/weapon_ins2ak12"
#include "ins2/arifl/weapon_ins2m16a4"
#include "ins2/arifl/weapon_ins2f2000"
#include "ins2/arifl/weapon_ins2l85a2"
#include "ins2/brifl/weapon_ins2g3a3"
#include "ins2/brifl/weapon_ins2m14ebr"
#include "ins2/explo/weapon_ins2mk2" // This and next array too.
#include "ins2/explo/weapon_ins2m79"
#include "ins2/lmg/weapon_ins2m249"
#include "ins2/handg/weapon_ins2m29" // That's how all revolvers should reload :D
#include "ins2/handg/weapon_ins2glock17"
#include "ins2/srifl/weapon_ins2m40a1"
#include "ins2/carbn/weapon_ins2mk18"
#include "ins2/carbn/weapon_ins2m4a1"
#include "ins2/smg/weapon_ins2ump45"
#include "ins2/smg/weapon_ins2mp7"
#include "ins2/shotg/weapon_ins2m590"
#include "ins2/explo/weapon_ins2at4"
#include "ins2/handg/weapon_ins2webley"
#include "ins2/handg/weapon_ins2deagle"
const array<string> ArrayPackIns2Modern =
{
	"weapon_ins2kabar",
	"weapon_ins2usp",
	"weapon_medkit",
	"weapon_ins2ak12",
	"weapon_ins2m16a4",
	"weapon_ins2f2000",
	"weapon_ins2l85a2",
	"weapon_ins2g3a3",
	"weapon_ins2m14ebr",
	"weapon_ins2mk2",
	"weapon_ins2m79",
	"weapon_ins2m249",
	"weapon_ins2m29",
	"weapon_ins2glock17",
	"weapon_ins2m40a1",
	"weapon_ins2mk18",
	"weapon_ins2m4a1",
	"weapon_ins2ump45",
	"weapon_ins2mp7",
	"weapon_ins2m590",
	"weapon_ins2at4",
	"weapon_ins2webley",
	"weapon_ins2deagle"
};
#include "ins2/arifl/weapon_ins2akm"
#include "ins2/arifl/weapon_ins2stg44"
#include "ins2/arifl/weapon_ins2galil"
#include "ins2/arifl/weapon_ins2ak74"
#include "ins2/brifl/weapon_ins2fnfal"
#include "ins2/handg/weapon_ins2beretta"
#include "ins2/handg/weapon_ins2python"
#include "ins2/lmg/weapon_ins2mg42"
#include "ins2/lmg/weapon_ins2m60"
#include "ins2/explo/weapon_ins2law"
#include "ins2/explo/weapon_ins2m2"
#include "ins2/explo/weapon_ins2pzschreck"
#include "ins2/shotg/weapon_ins2m1014"
#include "ins2/shotg/weapon_ins2coach"
#include "ins2/shotg/weapon_ins2ithaca"
#include "ins2/shotg/weapon_ins2saiga12"
#include "ins2/smg/weapon_ins2mp5k"
#include "ins2/carbn/weapon_ins2sks"
#include "ins2/carbn/weapon_ins2aks74u"
#include "ins2/melee/weapon_ins2knuckles"
#include "ins2/srifl/weapon_ins2dragunov"
const array<string> ArrayPackIns2Alt =
{
	"weapon_ins2knuckles",
	"weapon_ins2beretta",
	"weapon_medkit",
	"weapon_ins2akm",
	"weapon_ins2pzschreck",
	"weapon_ins2stg44",
	"weapon_ins2ak74",
	"weapon_ins2fnfal",
	"weapon_ins2law",
	"weapon_ins2mk2",
	"weapon_ins2mg42",
	"weapon_ins2m60",
	"weapon_ins2python",
	"weapon_ins2dragunov",
	"weapon_ins2aks74u",
	"weapon_ins2sks",
	"weapon_ins2mp5k",
	"weapon_ins2saiga12",
	"weapon_ins2m1014",
	"weapon_ins2ithaca",
	"weapon_ins2m2",
	"weapon_ins2coach",
	"weapon_ins2galil"
};
// Weapons pack END OF THE MESS!!!

// End of including things.

// We want to start the game once survival is on.
float flSurvivalStartDelay = g_EngineFuncs.CVarGetFloat( "mp_survival_startdelay" );

// Float that'll increase every time a round starts.
float FloatForRounds = 0;
// Float that'll increase squadmakers spawns limit.
float FloatForSpawns = 1;

// Dictionary for created entities.
dictionary keyvalues;

// Array for the weapons. so they can be set up dynamically.
array<string> sWeapons;

// Float for get the proper array case for purchase zone.
float FloatGivenArray = 0;

// -TODO hook for playerjoin for equip them with some ammo. so the given weapons had more than 1 clip :D
void MapInit()
{
	// Multi-Language
	MultiLanguageInit();
	
	// Custom zombie.
	MonsterZombieCustom::Register();
	
	// Just debugging. you can disable this.
	RegisterGameDebugMessager();
	
	// Register new entities.
	g_CustomEntityFuncs.RegisterCustomEntity( "sex_box", "mystery_box" );
	g_CustomEntityFuncs.RegisterCustomEntity( "mystery_icon", "mystery_icon" );
	g_CustomEntityFuncs.RegisterCustomEntity( "purchase_zone", "purchase_zone" );
	
	// Precache new entities.
	g_Game.PrecacheOther( "monster_custom_zombie" );
	g_Game.PrecacheOther( "mystery_icon" );
	g_Game.PrecacheOther( "mystery_box" );

	// Randomly register weapons each map starts.
	switch (Math.RandomLong( 0, 6 ))
	{
		case 0:	// Native Sven Co-op Weapons.-
		{
			// Read and modify the proper array for this cases.
			ReadArray( ArrayPackNative );
			FloatGivenArray = 0;
		}
		break;

		case 1:	// Afraid Of Monsters Weapons.-
		{
			RegisterCoFKNIFE();
			RegisterCoFSPEAR();
			RegisterCoFHAMMER();
			RegisterCoFDEAGLE();
			RegisterCoFGLOCK18();
			RegisterCoFP228();
			RegisterCoFMP5K();
			RegisterCoFAK74();
			RegisterCoFBENELLI();
			RegisterCoFL85();
			RegisterCoFANACONDA();
			RegisterCoFUZI();
			RegisterCoFBERETTA();
			RegisterCoFGOLDEN();
			// not from AoM but to have both at same ammout of guns.
			RegisterCoFAXE();
			RegisterCoFM76();

			ReadArray( ArrayPackAoMDC );
			FloatGivenArray = 1;
		}
		break;

		case 2:	// Cry Of Fear Weapons.-
		{	
			RegisterCoFSWITCHBLADE();
			RegisterCoFBRANCH();
			RegisterCoFNIGHTSTICK();
			RegisterCoFSLEDGEHAMMER();
			RegisterCoFGLOCK();
			RegisterCoFREVOLVER();
			RegisterCoFP345();
			RegisterCoFSHOTGUN();
			RegisterCoFMP5();
			RegisterCoFVP70();
			RegisterCoFTMP();
			RegisterCoFGEWEHR();
			RegisterCoFM16();
			RegisterCoFRIFLE(); // q? -Comment leaved here by gaftherman that asked "what?" into the .as while livesharing code. now going to full release.
			RegisterCoFFAMAS();
			// If you get this then GG ez game bro. both are strong weapons and also both have unlimited ammo x[
			RegisterCoFCAMERA();
			RegisterCoFBOOKLASER();

			ReadArray( ArrayPackCoF );
			FloatGivenArray = 2;
		}
		break;
		
		case 3:	// Counter-Strike 1.6 Weapons.-
		{
			// i am not a fan of cs1.6 but those weapons really does that absurd damage? if you're a server op i strongly recommend nerf them.
			CS16_KNIFE::Register();
			CS16_GLOCK18::Register();
			CS16_USP::Register();
			CS16_P228::Register();
			CS16_57::Register();
			CS16_ELITES::Register();
			CS16_DEAGLE::Register();
			CS16_M3::Register();
			CS16_XM1014::Register();
			CS16_MAC10::Register();
			CS16_TMP::Register();
			CS16_MP5::Register();
			CS16_UMP45::Register();
			CS16_P90::Register();
			CS16_HEGRENADE::Register();
			CS16_C4::Register();
			CS16_FAMAS::Register();
			CS16_GALIL::Register();
			CS16_AK47::Register();
			CS16_M4A1::Register();
			CS16_AUG::Register();
			CS16_SG552::Register();
			CS16_SCOUT::Register();
			CS16_AWP::Register();
			CS16_SG550::Register();
			CS16_G3SG1::Register();
			CS16_M249::Register();

			ReadArray( ArrayPackCs16 );
			FloatGivenArray = 3;
		}
		break;

		case 4:	// Insurgency 2 WW2 topic Weapons pack.-
		{
			INS2_ASVAL::Register();
			INS2_FG42::Register();
			INS2_M1GARAND::Register();
			INS2_ENFIELD::Register();
			INS2_RPG7::Register();
			INS2_LEWIS::Register();
			INS2_RPK::Register();
			INS2_M1911::Register();
			INS2_MAKAROV::Register();
			INS2_C96::Register();
			INS2_KUKRI::Register();
			INS2_MOSIN::Register();
			INS2_G43::Register();
			INS2_M1A1PARA::Register();
			INS2_C96CARBINE::Register();
			INS2_MP40::Register();
			INS2_PPSH41::Register();
			INS2_MP18::Register();
			INS2_PZFAUST::Register();
			INS2_K98K::Register();
			INS2_M24GRENADE::Register();
			INS2_STERLING::Register();
			INS2_M1928::Register();
			
			ReadArray( ArrayPackIns2WW2 );
			FloatGivenArray = 4;
		}
		break;

		case 5:	// Insurgency 2 Modern topic Weapons pack.-
		{
			INS2_AK12::Register();
			INS2_M16A4::Register();
			INS2_F2000::Register();
			INS2_G3A3::Register();
			INS2_L85A2::Register();
			INS2_M14EBR::Register();
			INS2_MK2GRENADE::Register();
			INS2_M79::Register();
			INS2_M249::Register();
			INS2_M29::Register();
			INS2_USP::Register();
			INS2_GLOCK17::Register();
			INS2_M40A1::Register();
			INS2_KABAR::Register();
			INS2_MK18::Register();
			INS2_M4A1::Register();
			INS2_UMP45::Register();
			INS2_MP7::Register();
			INS2_M590::Register();
			INS2_AT4::Register();
			INS2_WEBLEY::Register();
			INS2_DEAGLE::Register();
			
			ReadArray( ArrayPackIns2Modern );
			FloatGivenArray = 5;
		}
		break;

		case 6:	// Insurgency 2 Alternative Weapons pack.-
		{
			INS2_MK2GRENADE::Register();
			INS2_PYTHON::Register();
			INS2_AKM::Register();
			INS2_PZSCHRECK::Register();
			INS2_STG44::Register();
			INS2_AK74::Register();
			INS2_FNFAL::Register();
			INS2_LAW::Register();
			INS2_MG42::Register();
			INS2_M60::Register();
			INS2_M9BERETTA::Register();
			INS2_KNUCKLES::Register();
			INS2_AKS74U::Register();
			INS2_SKS::Register();
			INS2_MP5K::Register();
			INS2_GALIL::Register();
			INS2_COACH::Register();
			INS2_ITHACA::Register();
			INS2_M1014::Register();
			INS2_SAIGA12::Register();
			INS2_SVD::Register();
			INS2_M2FLAMETHROWER::Register();

			ReadArray( ArrayPackIns2Alt );
			FloatGivenArray = 6;
		}
		break;
	}
	// Enable game when survival is ON
	g_Scheduler.SetTimeout( "EnableGame", flSurvivalStartDelay );
}

// At this point this array contais the weapons pack set.
array<string> AvailableWeapons;

void ReadArray( const array<string> ArrayPack )
{
	g_Game.AlertMessage( at_console, "LIST OF WEAPONS SUPPORTED FOR THIS ATTEMPT-:\n" );
	for( uint i = 0; i < ArrayPack.length(); i++ )
    {
		AvailableWeapons.insertLast(ArrayPack[i]);
		g_Game.AlertMessage( at_console, ""+ArrayPack[i]+"\n" );
	}
}

void EnableGame()
{
	// Think time. 10 seconds is fine to respawn players if the last stading die at same time the last round's monster. and fine to not start a round while current didn't end yet.
	g_Scheduler.SetInterval( "SetRounds", 10.0f, g_Scheduler.REPEAT_INFINITE_TIMES );
	// This scheduler is used for global timer used for effects such as mystery_icon gives.
	g_Scheduler.SetInterval( "CheckTime", 1.0f, g_Scheduler.REPEAT_INFINITE_TIMES );
}

int GlobalTime = 0;

void CheckTime()
{
	if( GlobalTime == 0 )	// don't let drop bellow zero
		return;

	if( GlobalTime > 0 )
		GlobalTime -= 1;

	if( GlobalTime == 1 )
		RestoreEffects();
}

void RestoreEffects()
{
	for( int iPlayer = 1; iPlayer <= g_PlayerFuncs.GetNumPlayers(); ++iPlayer )
	{
		CBasePlayer@ pPlayer = g_PlayerFuncs.FindPlayerByIndex( iPlayer );

		pPlayer.pev.flags &= ~(FL_NOTARGET | FL_GODMODE);

		g_EntityFuncs.FireTargets( "EFFECTSNOT", null, null, USE_TOGGLE );
	}
}

void SetRounds()
{
	CBaseEntity@ pMonsters = null;
	CBaseEntity@ npcMaker = null;
	
	// Look for living monsters
    while( ( @pMonsters = g_EntityFuncs.FindEntityByClassname( pMonsters, "monster_*" ) ) !is null )
    {
        if( pMonsters.IsAlive() )
        {
			CBaseMonster@ pMonster = cast<CBaseMonster@>(pMonsters);

			if( pMonster.m_hEnemy.GetEntity() is null || !pMonster.m_hEnemy.GetEntity().IsAlive() )
			{
				array<EHandle> PlayerAlive;

				for( int playerID = 1; playerID <= g_Engine.maxClients; playerID++ )
				{
					CBasePlayer@ pPlayer = g_PlayerFuncs.FindPlayerByIndex( playerID );

					if( pPlayer is null || !pPlayer.IsAlive() )
						continue;

					PlayerAlive.insertLast( pPlayer );
				}

				CBasePlayer@ pPlayer = cast<CBasePlayer@>(PlayerAlive[Math.RandomLong( 0, PlayerAlive.length()-1 )].GetEntity());

				// Make livig mosters angry so they look for players.
				if( pPlayer !is null)
					pMonster.m_hEnemy = @pPlayer;
			}
			
			//g_Game.AlertMessage( at_console, "monster found. return code.\n" );
			return;
        }
    }
	
	// If no monsters alive then change to next round.
	FloatForRounds += 1;
	
	while( ( @npcMaker = g_EntityFuncs.FindEntityByClassname( npcMaker, "squadmaker" ) ) !is null )
	{
		if( FloatForRounds == "*0" ) // -TODO Va a funcioar? cada 10 rondas se suma 1 al maxcout -> "*0" (i.e 10, 20, 30)
		{
			FloatForSpawns += 1;
		}
		
		edict_t@ pEdict = npcMaker.edict();
		g_EntityFuncs.DispatchKeyValue( pEdict, "monstercount", ""+ FloatForSpawns );
		g_EntityFuncs.DispatchKeyValue( pEdict, "m_imaxlivechildren", ""+ MaxMonstersAtTime );
		g_PlayerFuncs.ClientPrintAll( HUD_PRINTTALK, "MAP: Round: " + FloatForRounds + "\n" );
		g_Game.AlertMessage( at_console, "Squadmaker's actually monstercount is: "+FloatForSpawns+"\n" );
	}

	// Resurrect players each round ends.
	ForPlayers( 0 );
}

// Start of Classes

HUDTextParams FragsCountHudText;

class purchase_zone : ScriptBaseEntity
{
	private string Sound = "mikk/misc/shop.wav";
	bool KeyValue( const string& in szKey, const string& in szValue ) 
	{
		if( szKey == "minhullsize" ) 
		{
			g_Utility.StringToVector( self.pev.vuser1, szValue );
			return true;
		} 
		else if( szKey == "maxhullsize" ) 
		{
			g_Utility.StringToVector( self.pev.vuser2, szValue );
			return true;
		}
		else 
			return BaseClass.KeyValue( szKey, szValue );
	}
	
	void Spawn() 
	{
        self.Precache();

        self.pev.movetype = MOVETYPE_NONE;
        self.pev.solid = SOLID_NOT;
		self.pev.effects |= EF_NODRAW;

        if( self.GetClassname() == "purchase_zone" && string( self.pev.model )[0] == "*" && self.IsBSPModel() )
        {
            g_EntityFuncs.SetModel( self, self.pev.model );
            g_EntityFuncs.SetSize( self.pev, self.pev.mins, self.pev.maxs );
        }
		else
		{
			g_EntityFuncs.SetSize( self.pev, self.pev.vuser1, self.pev.vuser2 );		
		}

		g_EntityFuncs.SetOrigin( self, self.pev.origin );
		
		if( !self.pev.SpawnFlagBitSet( 1 ) )
		{	
			SetThink( ThinkFunction( this.TriggerThink ) );
			self.pev.nextthink = g_Engine.time + 0.1f;
		}

		CurrentFrags();
		
        BaseClass.Spawn();
	}

	void Precache()
	{
		g_Game.PrecacheGeneric( "sound/" + Sound );
		g_SoundSystem.PrecacheSound( Sound );
		
		if( !string( self.pev.netname ).IsEmpty() )
			g_Game.PrecacheOther( self.pev.netname );
		if( !string( self.pev.message ).IsEmpty() )
			g_Game.PrecacheOther( self.pev.message );
	
		BaseClass.Precache();
	}

    void Use(CBaseEntity@ pActivator, CBaseEntity@ pCaller, USE_TYPE useType, float value)
    {
		if( self.pev.SpawnFlagBitSet( 1 ) )
		{	
			SetThink( ThinkFunction( this.TriggerThink ) );
			self.pev.nextthink = g_Engine.time + 0.1f;
		}
	}
	
	void TriggerThink() 
	{
		for( int iPlayer = 1; iPlayer <= g_PlayerFuncs.GetNumPlayers(); ++iPlayer )
		{
			CBasePlayer@ pPlayer = g_PlayerFuncs.FindPlayerByIndex( iPlayer );

			if( pPlayer is null or !pPlayer.IsConnected() )
				continue;

			if( UTILS::InsideZone( pPlayer, self ) )
			{
				if( pPlayer.HasNamedPlayerItem( self.pev.netname ) )
				{
					g_EntityFuncs.FireTargets( "DISCOUNT_PRICE", pPlayer, pPlayer, USE_ON );
				}
				else
				{
					g_EntityFuncs.FireTargets( "ORIGINAL_PRICE", pPlayer, pPlayer, USE_ON );
				}

				if( pPlayer.pev.button & IN_USE != 0 )
				{
					if( !string( self.pev.message ).IsEmpty() 
					and pPlayer.HasNamedPlayerItem( self.pev.netname ) !is null
					and pPlayer.pev.frags >= self.pev.frags * 0.4 )
					{
						pPlayer.pev.frags -= self.pev.frags * 0.4;
						
						g_SoundSystem.EmitSound( self.edict(), CHAN_STATIC, Sound, 1.0f, ATTN_NONE );
						
						keyvalues ["origin"] = pPlayer.GetOrigin().ToString();
						keyvalues ["m_flCustomRespawnTime"] = "-1";
						if( FloatGivenArray == 0 )	// Native
							g_EntityFuncs.CreateEntity( KeyPackZero, keyvalues, true );
						if( FloatGivenArray == 1 )	// AoM
							g_EntityFuncs.CreateEntity( KeyPackZero, keyvalues, true );
						if( FloatGivenArray == 2 )	// CoF
							g_EntityFuncs.CreateEntity( KeyPackZero, keyvalues, true );
						if( FloatGivenArray == 3 )	// CS16
							g_EntityFuncs.CreateEntity( KeyPackZero, keyvalues, true );
						if( FloatGivenArray == 4 )	// ins2 WW2
							g_EntityFuncs.CreateEntity( KeyPackZero, keyvalues, true );
						if( FloatGivenArray == 5 )	// ins2 Modern
							g_EntityFuncs.CreateEntity( KeyPackZero, keyvalues, true );
						if( FloatGivenArray == 6 )	// ins2 Alt
							g_EntityFuncs.CreateEntity( KeyPackZero, keyvalues, true );
					}

					if( pPlayer.pev.frags >= self.pev.frags )
					{
						pPlayer.pev.frags -= self.pev.frags;

						g_SoundSystem.EmitSound( self.edict(), CHAN_STATIC, Sound, 1.0f, ATTN_NONE );

						if( !string( self.pev.netname ).IsEmpty() and pPlayer.HasNamedPlayerItem( self.pev.netname ) is null )
						{
							keyvalues ["origin"] = pPlayer.GetOrigin().ToString();
							keyvalues ["m_flCustomRespawnTime"] = "-1";
							g_EntityFuncs.CreateEntity( self.pev.netname, keyvalues, true );	// -TODO Ditto.
						}

						if( !string( self.pev.target ).IsEmpty() )
						{
							g_EntityFuncs.FireTargets( self.pev.target, pPlayer, pPlayer, USE_TOGGLE );
						}

						if( self.pev.SpawnFlagBitSet( 2 ) )
						{
							g_EntityFuncs.Remove( self );
						}
					}
				}
			}
		}
		
		// 0.1 frames make you buy twice or more if hold E for a moment
		self.pev.nextthink = g_Engine.time + 0.3f;
	}

	void CurrentFrags( CBasePlayer@ pPlayer )
	{
		keyvalues =	
		{
			{ "message", "Cost: "+int(self.pev.frags * 0.4)+" (60% off) \n You have: "+int(pPlayer.pev.frags)+"\n"},
			{ "message_spanish", "Costo: "+int(self.pev.frags * 0.4)+" (60% descuento) \n Tu tienes: "+int(pPlayer.pev.frags)+"\n"},
			{ "x", "-1"},
			{ "y", "0.40"},
			{ "holdtime", "0.5"},
			{ "fadein", "0.0"},
			{ "channel", "1"},
			{ "spawnflags", "1"},
			{ "color", "255 0 0"},
			{ "targetname", "DISCOUNT_PRICE" } // -TODO asignar un nombre unico por entidad. idk como se hace.
		};
		g_EntityFuncs.CreateEntity( "game_text_custom", keyvalues, true );
		
		keyvalues =	
		{
			{ "message", "Cost: "+int(self.pev.frags)+" \n You have: "+int(pPlayer.pev.frags)+"\n"},
			{ "message_spanish", "Costo: "+int(self.pev.frags)+" \n Tu tienes: "+int(pPlayer.pev.frags)+"\n"},
			{ "x", "-1"},
			{ "y", "0.40"},
			{ "holdtime", "0.5"},
			{ "fadein", "0.0"},
			{ "channel", "1"},
			{ "spawnflags", "1"},
			{ "color", "255 0 0"},
			{ "targetname", "ORIGINAL_PRICE" }
		};
		g_EntityFuncs.CreateEntity( "game_text_custom", keyvalues, true );
	}
}

class sex_box : ScriptBaseEntity  
{
	// -TODO buscar/robar sonidos
	private string strOpenSound = "ambience/particle_suck2.wav";

	void Use(CBaseEntity@ pActivator, CBaseEntity@ pCaller, USE_TYPE useType, float flValue)
	{
		// -TODO crear efectos.
		//g_SoundSystem.EmitSound( self.edict(), CHAN_ITEM, strOpenSound, 1.0f, ATTN_NORM );

		float flRandom = Math.RandomFloat( 0, 1 );

		keyvalues ["origin"] = pActivator.GetOrigin().ToString();

		if( flRandom >= 0.10 )
		{
			keyvalues ["m_flCustomRespawnTime"] = "-1";
			g_EntityFuncs.CreateEntity( AvailableWeapons[Math.RandomLong( 0, AvailableWeapons.length()-1 )], keyvalues, true );
		}
		else if( flRandom < 0.90 )
		{
			g_EntityFuncs.CreateEntity( "mystery_icon", keyvalues, true );
		}
	}

	void Spawn()
	{
		Precache();
		
		self.pev.movetype 		= MOVETYPE_NONE;
		self.pev.solid 			= SOLID_BBOX;
		
		g_EntityFuncs.SetOrigin( self, self.pev.origin );
		g_EntityFuncs.SetModel( self, "models/mikk/misc/mysterybox.mdl" );
		g_EntityFuncs.SetSize( self.pev, Vector( -27, -0, -16 ), Vector( 27, 29, 15 ) );
		
	    BaseClass.Spawn();
	}

	void Precache()
	{
		g_Game.PrecacheModel( "models/mikk/misc/mysterybox.mdl" );
		g_Game.PrecacheGeneric( "models/mikk/misc/mysterybox.mdl" );

		g_SoundSystem.PrecacheSound( strOpenSound );

		g_Game.PrecacheGeneric( "sound/" + strOpenSound );

		BaseClass.Precache();
	}
}

// -TODO npc should have a small chance to generate this.
class mystery_icon : ScriptBaseEntity  
{
	bool IsDisabled = false;
	void Spawn()
	{
		Precache();

		self.pev.movetype 		= MOVETYPE_NONE;
		self.pev.solid 			= SOLID_TRIGGER;
		
		g_EntityFuncs.SetOrigin( self, self.pev.origin );

		g_EntityFuncs.SetModel( self, "models/mikk/misc/limitless_potential.mdl" );

		g_EntityFuncs.SetSize( self.pev, Vector( -32, -32, -32 ), Vector( 32, 32, 32 ) );
		
		// -TODO Fadethink SetTimeout after 30 seconds.
		
	    BaseClass.Spawn();
	}

	void Precache()
	{
		g_Game.PrecacheModel( "models/mikk/misc/limitless_potential.mdl" );
		g_Game.PrecacheGeneric( "models/mikk/misc/limitless_potential.mdl" );

		BaseClass.Precache();
	}

	void Touch( CBaseEntity@ pOther )
	{
		if( !pOther.IsPlayer() or !pOther.IsAlive() or IsDisabled )
			return;

		IsDisabled = true; // cuz Touch activates it twice or more. idk
		CBaseEntity@ pTronal = null;

		// -TODO Custom sounds per each case.
		switch (Math.RandomLong( 0, 9 ))
		{
			case 0:		//	restock ammo 
			{
				ForPlayers( 3 );
			}
			break;

			case 1:		//	Remove weapons that's non-melee
			{
				for( uint i = 0; i < MAX_ITEM_TYPES; i++ )
				{
					CBasePlayerItem@ pItem = cast<CBasePlayer@>(pOther).m_rgpPlayerItems( i );

					while( pItem !is null )
					{
						CBasePlayerWeapon@ pWeapon = pItem.GetWeaponPtr();

						if(pWeapon.PrimaryAmmoIndex() > -1 || pWeapon.SecondaryAmmoIndex() > -1 )
						{
							cast<CBasePlayer@>(pOther).RemovePlayerItem( pItem );
						}

						@pItem = cast<CBasePlayerItem@>( pItem.m_hNextItem.GetEntity() );
					}
				}
				g_EntityFuncs.FireTargets( "NOWEAPONS", pOther, pOther, USE_TOGGLE );
			}
			break;

			case 2:		//	Remove all your ammo
			{
				// -TODO eliminar toda la municion de pOwner
				for( uint i = 0; i < MAX_ITEM_TYPES; i++ )
				{
				}
				g_EntityFuncs.FireTargets( "NOAMMO", pOther, pOther, USE_TOGGLE );
			}
			break;

			case 3:		//	notarget 60s
			{
				ForPlayers( 2 );
			}
			break;

			case 4:		// Godmode
			{
				ForPlayers( 1 );
			}
			break;

			case 5:		//	kill all monsters on this round
			{
				while( ( @pTronal = g_EntityFuncs.FindEntityByClassname( pTronal, "monster_*" ) ) !is null )
				{
					if( pTronal.IsAlive() )
					{
						pTronal.TakeDamage( pOther.pev, pOther.pev, 999, DMG_ALWAYSGIB | DMG_SNIPER );

						g_EntityFuncs.FireTargets( "KILLHORDE", null, null, USE_TOGGLE );
					}
				}
			}
			break;
			
			case 6:		// InstaKill
			{
				while( ( @pTronal = g_EntityFuncs.FindEntityByClassname( pTronal, "monster_*" ) ) !is null )
				{
					if( pTronal.IsAlive() )
					{
						pTronal.pev.health = 1;
						
						g_EntityFuncs.FireTargets( "INSTAKILL", null, null, USE_TOGGLE );
					}
				}
			}
			break;

			case 7: 	// Respawn
			{
				ForPlayers( 0 );
			}
			break;

			case 8:		// Relocate mystery box
			{
				g_EntityFuncs.FireTargets( "mysterybox_replace", pOther, pOther, USE_TOGGLE );
			}
			break;

			case 9:		// idk
			{
				pOther.pev.health = 1;
				g_EntityFuncs.FireTargets( "PPLAYERDEBUF", pOther, pOther, USE_TOGGLE );
			}
			break;
		}

		g_EntityFuncs.Remove( self );
	}

	void ForPlayers( int mode )
	{
		for( int iPlayer = 1; iPlayer <= g_PlayerFuncs.GetNumPlayers(); ++iPlayer )
		{
			CBasePlayer@ pPlayer = g_PlayerFuncs.FindPlayerByIndex( iPlayer );

			if( pPlayer is null or !pPlayer.IsConnected() or pPlayer.IsAlive() )
				continue;

			if( mode == 0 )
			{
				g_EntityFuncs.FireTargets( "RESPAWNMSG", null, null, USE_TOGGLE );

				g_PlayerFuncs.RespawnPlayer( pPlayer, false, true );

				if( pPlayer.m_hActiveItem.GetEntity() is null )
				{
					pPlayer.GiveNamedItem( AvailableWeapons[Math.RandomLong( 0, AvailableWeapons.length()-1 )] );
				}
				
				RESPAWNDEAD_KEEPWEAPONS::ReEquipCollected( pPlayer, true );
			}
			else if( mode == 1 )
			{
				g_EntityFuncs.FireTargets( "GODMODE", null, null, USE_TOGGLE );
				pPlayer.pev.flags |= FL_GODMODE;
			}
			else if( mode == 2 )
			{
				g_EntityFuncs.FireTargets( "NOTARGET", null, null, USE_TOGGLE );
				pPlayer.pev.flags |= FL_NOTARGET;
			}
			else if( mode == 3 )
			{
				g_EntityFuncs.FireTargets( "AMMORESTOCK", null, null, USE_TOGGLE );
				for( uint i = 0; i < MAX_ITEM_TYPES; i++ )
				{
					CBasePlayerItem@ pItem = pPlayer.m_rgpPlayerItems( i );

					while( pItem !is null )
					{
						CBasePlayerWeapon@ pWeapon = pItem.GetWeaponPtr();

						if(pWeapon.PrimaryAmmoIndex() > -1)
						{
							pPlayer.GiveAmmo(pWeapon.iMaxAmmo1(), pWeapon.pszAmmo1(), pWeapon.iMaxAmmo1());
						}
						
						if(pWeapon.SecondaryAmmoIndex() > -1)
						{
							pPlayer.GiveAmmo(pWeapon.iMaxAmmo2(), pWeapon.pszAmmo2(), pWeapon.iMaxAmmo2());
						}

						@pItem = cast<CBasePlayerItem@>( pItem.m_hNextItem.GetEntity() );
					}
				}
			}
			GlobalTime += 60;
		}
	}
}

//	End of this fucking script-
//	Specials thanks to Gaftherman AKA Pavotherman or Gaf The R Man for help me with this damn thing.
//	Thanks to Outerbeast. Sparks. H2 and people at Developers server.

