/*
	Call for Toggle survival mode.
*/
void togglesurvival( CBaseEntity@ pActivator,CBaseEntity@ pCaller, USE_TYPE useType, float flValue )
{
    if( !g_SurvivalMode.IsActive()
    or !g_SurvivalMode.IsEnabled() )
    {
        g_SurvivalMode.Activate( true );
        g_SurvivalMode.Enable();
    }
    else
    {
        g_SurvivalMode.Disable();
    }
}

/*
	Call for trigger something depending the ammt of players connected
*/
void currentplayers( CBaseEntity@ pActivator,CBaseEntity@ pCaller, USE_TYPE useType, float flValue )
{
	g_EntityFuncs.FireTargets( "players_" + g_PlayerFuncs.GetNumPlayers(), null, null, USE_TOGGLE, 0.0f, 0.0f );
	// Your entities logics should be named "players_+(number of players)" stack your map logics up to 32
}