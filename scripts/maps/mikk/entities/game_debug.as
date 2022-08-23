/*
	Really simple script for showing console debug messages if developer is higher than 0
	Useful if you use this while doing complicated logics so you know the state of every entity
*/
void RegisterGameDebugMessager() 
{
	g_CustomEntityFuncs.RegisterCustomEntity( "game_debug", "game_debug" );
}

class game_debug : ScriptBaseEntity
{
	void Use(CBaseEntity@ pActivator, CBaseEntity@ pCaller, USE_TYPE useType, float value)
	{
		g_Game.AlertMessage( at_console, "MAP DEBUG-: "+self.pev.message );
	}
}