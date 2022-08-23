/* 
	SUGGESTIONS:

	1-	un bool para que server ops decidan limite maximo de npcs vivos al mismo tiempo. para evitar freezeos en servers kk


CTRL+F "-TODO" para cosas que agregar y no olvidarme

*/


// Resurrect players each round and keep their weapons and ammo.
#include "respawndead_keepweapons"

// Purchase zone
#include "mikk/entities/utils"
#include "mikk/entities/purchase_zone"
#include "mikk/entities/game_debug"
#include "mikk/npc/npc_zombie"

// Weapons packs.-
#include "MKZS_weapons"

string MaxMonstersAtTime = 10;

float flSurvivalStartDelay = g_EngineFuncs.CVarGetFloat( "mp_survival_startdelay" );

// cambiar monstercount value a los squadmakers
float floatSpawns = 0;

// Para el mysterybox
dictionary keyvalues;

array<string> sWeapons;

void MapInit()
{
	RegisterPurchaseZone();
	MonsterZombieCustom::Register();
	RegisterGameDebugMessager();
	g_Scheduler.SetTimeout( "EnableGame", flSurvivalStartDelay );
	g_CustomEntityFuncs.RegisterCustomEntity( "sex_box", "mystery_box" );
	g_CustomEntityFuncs.RegisterCustomEntity( "mystery_icon", "mystery_icon" );
	g_Game.PrecacheOther( "monster_custom_zombie" );
	g_Game.PrecacheOther( "mystery_icon" );
	g_Game.PrecacheOther( "mystery_box" );

	// Randomly register weapons each map restart.
	switch (Math.RandomLong( 0, 1 ))
	{
		case 0:	// Native Sven Co-op Weapons.-
		{
			// Read the proper array for this case.
			ReadArray( ArrayPackNative );
		}
		break;

		case 1:	// Afraid Of Monsters Weapons.-
		{
		/*	CoFKNIFE::POSITION = 11;
			RegisterCoFKNIFE();
			CoFSPEAR::POSITION = 16;
			RegisterCoFSPEAR();
			CoFHAMMER::POSITION = 13;
			RegisterCoFHAMMER();
			CoFDEAGLE::POSITION = 17;
			RegisterCoFDEAGLE();
			CoFGLOCK18::POSITION = 16;
			RegisterCoFGLOCK18();
			CoFP228::POSITION = 14;
			RegisterCoFP228();
			CoFMP5K::POSITION = 13;
			RegisterCoFMP5K();
			CoFAK74::POSITION = 14;
			RegisterCoFAK74();
			CoFBENELLI::POSITION = 12;
			RegisterCoFBENELLI();
			CoFL85::POSITION = 13;
			RegisterCoFL85();
			CoFANACONDA::POSITION = 18;
			RegisterCoFANACONDA();
			CoFUZI::POSITION = 14;
			RegisterCoFUZI();
			CoFBERETTA::POSITION = 10;
			RegisterCoFBERETTA();
			CoFGOLDEN::POSITION = 12;
			RegisterCoFGOLDEN();
			// not from AoM but to have both at same guns.
			CoFAXE::POSITION = 18;
			RegisterCoFAXE();
			CoFM76::POSITION = 16;
			RegisterCoFM76();

			ReadArray( ArrayPackAoMDC );
		}
		break;

		case 2:	// Cry Of Fear Weapons.-
		{	
			RegisterCoFSWITCHBLADE();
			CoFBRANCH::POSITION = 14;
			RegisterCoFBRANCH();
			CoFNIGHTSTICK::POSITION = 15;
			RegisterCoFNIGHTSTICK();
			RegisterCoFSLEDGEHAMMER();
			CoFGLOCK::POSITION = 11;
			RegisterCoFGLOCK();
			CoFREVOLVER::POSITION = 13;
			RegisterCoFREVOLVER();
			CoFP345::POSITION = 15;
			RegisterCoFP345();
			CoFSHOTGUN::POSITION = 15;
			RegisterCoFSHOTGUN();
			CoFMP5::POSITION = 10;
			RegisterCoFMP5();
			CoFVP70::POSITION = 12;
			RegisterCoFVP70();
			CoFTMP::POSITION = 11;
			RegisterCoFTMP();
			CoFG43::POSITION = 15;
			RegisterCoFGEWEHR();
			CoFM16::POSITION = 10;
			RegisterCoFM16();
			CoFRIFLE::POSITION = 12;
			RegisterCoFRIFLE(); // q?
			CoFFAMAS::POSITION = 11;
			RegisterCoFFAMAS();
			// If you get this GG ez
			CoFCAMERA::POSITION = 11;
			RegisterCoFCAMERA();
			CoFBOOKLASER::POSITION = 10;
			RegisterCoFBOOKLASER();

			ReadArray( ArrayPackCoF );
		}
		break;
		
		case 3:	// Counter-Strike 1.6 Weapons.-
		{
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
*/
			ReadArray( ArrayPackIns2Alt );
		}
		break;
	}	
}

array<string> AvailableWeapons;

void ReadArray( const array<string> ArrayPack )
{
	for( uint i = 0; i < ArrayPack.length(); i++ )
    {
		AvailableWeapons.insertLast(ArrayPack[i]);
		g_Game.AlertMessage( at_console, ""+ArrayPack[i]+" Registered.\n" );
	}
}

void EnableGame() 
{
	g_Scheduler.SetInterval( "SetRounds", 10.0f, g_Scheduler.REPEAT_INFINITE_TIMES );
	g_Scheduler.SetInterval( "CheckTime", 1.0f, g_Scheduler.REPEAT_INFINITE_TIMES );
}

int GlobalTime = 0;

void CheckTime()
{
	if( GlobalTime == 0 )
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

		g_EntityFuncs.FireTargets( "MAPTEXT_", null, null, USE_TOGGLE );
	}
}

void SetRounds()
{
	CBaseEntity@ pMonsters = null;
	CBaseEntity@ npcMaker = null;
    while( ( @pMonsters = g_EntityFuncs.FindEntityByClassname( pMonsters, "monster_*" ) ) !is null )
    {
        if( pMonsters.IsAlive() )
        {
			g_Game.AlertMessage( at_console, "monster found. return.\n" );
			return;
        }
    }
	
	while( ( @npcMaker = g_EntityFuncs.FindEntityByClassname( npcMaker, "squadmaker" ) ) !is null )
	{
		floatSpawns += 1;

		edict_t@ pEdict = npcMaker.edict();
		g_EntityFuncs.DispatchKeyValue( pEdict, "monstercount", ""+ floatSpawns );
		g_EntityFuncs.DispatchKeyValue( pEdict, "m_imaxlivechildren", ""+ MaxMonstersAtTime );
		g_PlayerFuncs.ClientPrintAll( HUD_PRINTTALK, "MAP: Round: " + floatSpawns + "\n" );
	}

	// Resurrect players each round ends.
	for( int iPlayer = 1; iPlayer <= g_PlayerFuncs.GetNumPlayers(); ++iPlayer )
	{
		CBasePlayer@ pPlayer = g_PlayerFuncs.FindPlayerByIndex( iPlayer );

		if( pPlayer is null or !pPlayer.IsConnected() or pPlayer.IsAlive() )
			continue;

		g_PlayerFuncs.RespawnPlayer( pPlayer, false, true );

		if( pPlayer.m_hActiveItem.GetEntity() is null )
		{
			pPlayer.GiveNamedItem( AvailableWeapons[Math.RandomLong( 0, AvailableWeapons.length()-1 )] );
		}
		
		RESPAWNDEAD_KEEPWEAPONS::ReEquipCollected( pPlayer, true );
	}

// -TODO custom sound
    NetworkMessage message( MSG_ALL, NetworkMessages::SVC_STUFFTEXT );
    message.WriteString( "spk buttons/bell1" );
    message.End();
}

class sex_box : ScriptBaseEntity  
{
	bool WpnBoxDisabled = false;
	// -TODO buscar/robar sonidos de CoD 5
	private string strStartSound = "ambience/particle_suck2.wav";
	private string strMusicSound = "../media/valve.mp3";

	bool KeyValue( const string& in szKey, const string& in szValue )
	{
		if( szKey == "minhullsize" )
			g_Utility.StringToVector( self.pev.vuser1, szValue );
		else if( szKey == "maxhullsize" )
			g_Utility.StringToVector( self.pev.vuser2, szValue );
		else if( szKey == "opensound" )
			strStartSound = szValue;
		else if( szKey == "music" )
			strMusicSound = szValue;
		else
			return BaseClass.KeyValue( szKey, szValue );

		return true;
	}

	void Use(CBaseEntity@ pActivator, CBaseEntity@ pCaller, USE_TYPE useType, float flValue)
	{
		//g_SoundSystem.EmitSound( self.edict(), CHAN_ITEM, strStartSound, 1.0f, ATTN_NORM );

		float flRandom = Math.RandomFloat( 0, 1 );

		keyvalues ["origin"] = pActivator.GetOrigin().ToString();

		if( flRandom >= 0.10 )
		{
			keyvalues ["m_flCustomRespawnTime"] = "-1";
			//g_EntityFuncs.CreateEntity( AvailableWeapons[Math.RandomLong( 0, AvailableWeapons.length()-1 )], keyvalues, true );
			
			CBaseEntity@ pEntity = g_EntityFuncs.CreateEntity( AvailableWeapons[Math.RandomLong( 0, AvailableWeapons.length()-1 )], keyvalues, true );
			g_PlayerFuncs.ClientPrintAll( HUD_PRINTTALK, ""+pEntity.pev.classname+" Given.\n" );
		}
		else if( flRandom < 0.90 )
		{
			g_EntityFuncs.CreateEntity( "mystery_icon", keyvalues, true );
		}
		
		g_SoundSystem.EmitSound( self.edict(), CHAN_STATIC, strMusicSound, 1.0f, ATTN_NONE );
	}

	void Spawn()
	{
		Precache();
		
		self.pev.movetype 		= MOVETYPE_NONE;
		self.pev.solid 			= SOLID_BBOX;
		
		g_EntityFuncs.SetOrigin( self, self.pev.origin );

		if( string( self.pev.model ).IsEmpty() )
			g_EntityFuncs.SetModel( self, "models/mikk/misc/mysterybox.mdl" );
		else
			g_EntityFuncs.SetModel( self, self.pev.model );

		if( self.pev.vuser2 == g_vecZero && self.pev.vuser1 == g_vecZero )
		{
			g_EntityFuncs.SetSize( self.pev, Vector( -30, -16, -16 ), Vector( 30, 16, 16 ) );
		}
		
	    BaseClass.Spawn();
	}

	void Precache()
	{
		g_Game.PrecacheModel( "models/mikk/misc/mysterybox.mdl" );
		g_Game.PrecacheGeneric( "models/mikk/misc/mysterybox.mdl" );

		g_SoundSystem.PrecacheSound( strStartSound );
		g_SoundSystem.PrecacheSound( strMusicSound );

		g_Game.PrecacheGeneric( "sound/" + strStartSound );
		g_Game.PrecacheGeneric( "sound/" + strMusicSound );

		BaseClass.Precache();
	}
}

class mystery_icon : ScriptBaseEntity  
{
	private string EffectType = 0;

	bool KeyValue( const string& in szKey, const string& in szValue )
	{
		if( szKey == "EffectType" )
			EffectType = szValue;
		else
			return BaseClass.KeyValue( szKey, szValue );

		return true;
	}

	void Spawn()
	{
		Precache();

		self.pev.movetype 		= MOVETYPE_NONE;
		self.pev.solid 			= SOLID_TRIGGER;
		
		g_EntityFuncs.SetOrigin( self, self.pev.origin );

		g_EntityFuncs.SetModel( self, "models/mikk/misc/limitless_potential.mdl" );

		g_EntityFuncs.SetSize( self.pev, Vector( -16, -16, -16 ), Vector( 16, 16, 16 ) );
		
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
		if( !pOther.IsPlayer() or !pOther.IsAlive() )
			return;

		CBaseEntity@ pTronal = null;

		switch (Math.RandomLong( 0, 8 ))
		{
			case 0:		//	restock ammo 
			{
				ForPlayers( 3 );
				g_PlayerFuncs.ClientPrintAll( HUD_PRINTTALK, "DEBUG restock\n" );
			}
			break;

			case 1:		//	Remove weapons that's non-melee
			{
				g_PlayerFuncs.ClientPrintAll( HUD_PRINTTALK, "DEBUG remove weapon\n" );
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
				g_EntityFuncs.FireTargets( "MAPTEXT_", pOther, pOther, USE_TOGGLE );
				g_EntityFuncs.Remove( self );
			}
			break;

			case 2:		//	notarget 60s
			{
				ForPlayers( 2 );
				g_PlayerFuncs.ClientPrintAll( HUD_PRINTTALK, "DEBUG notarget\n" );
			}
			break;

			case 3:		// Godmode
			{
				ForPlayers( 1 );
				g_PlayerFuncs.ClientPrintAll( HUD_PRINTTALK, "DEBUG godmode\n" );
			}
			break;

			case 4:		//	kill all monsters on this round
			{
				g_PlayerFuncs.ClientPrintAll( HUD_PRINTTALK, "DEBUG kill horda\n" );
				while( ( @pTronal = g_EntityFuncs.FindEntityByClassname( pTronal, "monster_*" ) ) !is null )
				{
					if( pTronal.IsAlive() )
					{
						pTronal.TakeDamage( pOther.pev, pOther.pev, 999, DMG_ALWAYSGIB | DMG_SNIPER );

						g_EntityFuncs.FireTargets( "MAPTEXT_", null, null, USE_TOGGLE );
					}
				}
				g_EntityFuncs.Remove( self );
			}
			break;
			
			case 5:		// InstaKill
			{
				g_PlayerFuncs.ClientPrintAll( HUD_PRINTTALK, "DEBUG instakill\n" );
				while( ( @pTronal = g_EntityFuncs.FindEntityByClassname( pTronal, "monster_*" ) ) !is null )
				{
					if( pTronal.IsAlive() )
					{
						pTronal.pev.health = 1;
						
						g_EntityFuncs.FireTargets( "MAPTEXT_", null, null, USE_TOGGLE );
					}
				}
				g_EntityFuncs.Remove( self );
			}
			break;

			case 6: 	// Respawn
			{
				g_PlayerFuncs.ClientPrintAll( HUD_PRINTTALK, "DEBUG respawn\n" );
				ForPlayers( 0 );
			}
			break;

			case 7:		// Relocate mystery box
			{
				g_PlayerFuncs.ClientPrintAll( HUD_PRINTTALK, "DEBUG relocate\n" );
				g_EntityFuncs.FireTargets( "mystery_move_origin", pOther, pOther, USE_TOGGLE );
				g_EntityFuncs.Remove( self );
			}
			break;

			case 8:		// idk
			{
				g_PlayerFuncs.ClientPrintAll( HUD_PRINTTALK, "DEBUG debuf\n" );
				pOther.pev.health = 1;
				g_EntityFuncs.FireTargets( "MAPTEXT_", pOther, pOther, USE_TOGGLE );
				g_EntityFuncs.Remove( self );
			}
			break;
		}
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
				g_EntityFuncs.FireTargets( "MAPTEXT_", null, null, USE_TOGGLE );

				g_PlayerFuncs.RespawnPlayer( pPlayer, false, true );

				RESPAWNDEAD_KEEPWEAPONS::ReEquipCollected( pPlayer, true );
			}
			else if( mode == 1 )
			{
				// godmode
				g_EntityFuncs.FireTargets( "MAPTEXT_", null, null, USE_TOGGLE );
				pPlayer.pev.flags |= FL_GODMODE;
			}
			else if( mode == 2 )
			{
				// notarget
				g_EntityFuncs.FireTargets( "MAPTEXT_", null, null, USE_TOGGLE );
				pPlayer.pev.flags |= FL_NOTARGET;
			}
			else if( mode == 3 )
			{
				g_EntityFuncs.FireTargets( "MAPTEXT_", null, null, USE_TOGGLE );
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

			g_EntityFuncs.Remove( self );
		
		}
	}
}

// LIST OF REPLACEMENTS WEAPONS:

const array<string> ArrayPackNative =
{
	"weapon_handgrenade",
	"weapon_satchel",
	"weapon_tripmine",
	"weapon_crowbar",
	"weapon_grapple",
	"weapon_medkit",
	"weapon_pipewrench",
	"weapon_glock",
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
	"weapon_uziakimbo"
};

const array<string> ArrayPackAoMDC =
{
	"weapon_handgrenade",
	"weapon_satchel",
	"weapon_tripmine",
	"weapon_cofknife",
	"weapon_cofspear",
	"weapon_medkit",
	"weapon_cofhammer",
	"weapon_cofglock18",
	"weapon_cofp228",
	"weapon_cofdeagle",
	"weapon_cofmp5k",
	"weapon_cofak74",
	"weapon_cofbenelli",
	"weapon_cofl85",
	"weapon_cofaxe",
	"weapon_cofanaconda",
	"weapon_cofm76",
	"weapon_minigun",
	"weapon_cofuzi",
	"weapon_cofgolden",
	"weapon_cofberetta"
};

const array<string> ArrayPackCoF =
{
	"weapon_handgrenade",
	"weapon_satchel",
	"weapon_tripmine",
	"weapon_cofswitchblade",
	"weapon_cofbranch",
	"weapon_medkit",
	"weapon_cofnightstick",
	"weapon_cofglock",
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
	"weapon_minigun",
	"weapon_cofcamera",
	"weapon_cofbooklaser",
	"weapon_cofvp70"
};

const array<string> ArrayPackCs16 =
{
	"weapon_handgrenade",
	"weapon_satchel",
	"weapon_tripmine",
	"weapon_csknife",
	"weapon_csglock18",
	"weapon_medkit",
	"weapon_usp",
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

const array<string> ArrayPackIns2WW2 =
{
	"weapon_handgrenade",
	"weapon_satchel",
	"weapon_tripmine",
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
	"weapon_ins2makarov",
	"weapon_ins2c96",
	"weapon_ins2knuckles",
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

const array<string> ArrayPackIns2Modern =
{
	"weapon_handgrenade",
	"weapon_satchel",
	"weapon_tripmine",
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
	"weapon_ins2usp",
	"weapon_ins2glock17",
	"weapon_ins2kabar",
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

const array<string> ArrayPackIns2Alt =
{
	"weapon_handgrenade",
	"weapon_satchel",
	"weapon_tripmine",
	"weapon_ins2akm",
	"weapon_ins2pzschreck",
	"weapon_ins2stg44",
	"weapon_ins2ak74",
	"weapon_ins2fnfal",
	"weapon_ins2law",
	"weapon_ins2mk2",
	"weapon_ins2mg42",
	"weapon_ins2m60",
	"weapon_ins2beretta",
	"weapon_ins2python",
	"weapon_ins2knuckles",
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