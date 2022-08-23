void RegisterPurchaseZone() 
{
	g_CustomEntityFuncs.RegisterCustomEntity( "purchase_zone", "purchase_zone" );
}

HUDTextParams FragsCountHudText;
dictionary kv;

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
				g_EntityFuncs.FireTargets( ""+self.pev.target+"_text", pPlayer, pPlayer, USE_TOGGLE );
				CurrentFrags( pPlayer );

				if( pPlayer.pev.button & IN_USE != 0 )
				{
					if( !string( self.pev.message ).IsEmpty() 
					and pPlayer.HasNamedPlayerItem( self.pev.netname ) !is null
					and pPlayer.pev.frags >= self.pev.frags * 0.4 )
					{
						pPlayer.pev.frags -= self.pev.frags * 0.4;
						
						g_SoundSystem.EmitSound( self.edict(), CHAN_STATIC, Sound, 1.0f, ATTN_NONE );
						
						kv ["origin"] = pPlayer.GetOrigin().ToString();
						kv ["m_flCustomRespawnTime"] = "-1";
						g_EntityFuncs.CreateEntity( self.pev.message, kv, true );
					}

					if( pPlayer.pev.frags >= self.pev.frags )
					{
						pPlayer.pev.frags -= self.pev.frags;

						g_SoundSystem.EmitSound( self.edict(), CHAN_STATIC, Sound, 1.0f, ATTN_NONE );

						if( !string( self.pev.netname ).IsEmpty() and pPlayer.HasNamedPlayerItem( self.pev.netname ) is null )
						{
							kv ["origin"] = pPlayer.GetOrigin().ToString();
							kv ["m_flCustomRespawnTime"] = "-1";
							g_EntityFuncs.CreateEntity( self.pev.netname, kv, true );
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
		FragsCountHudText.x = -1;
		FragsCountHudText.y = 0.40;
		FragsCountHudText.r1 = RGBA_SVENCOOP.r;
		FragsCountHudText.g1 = RGBA_SVENCOOP.g;
		FragsCountHudText.b1 = RGBA_SVENCOOP.b;
		FragsCountHudText.fadeinTime = 0; 
		FragsCountHudText.holdTime = 2.0;
		FragsCountHudText.channel = 8;

		if( !string( self.pev.message ).IsEmpty() and pPlayer.HasNamedPlayerItem( self.pev.netname ) !is null)
			g_PlayerFuncs.HudMessage(pPlayer, FragsCountHudText,"Cost: "+int(self.pev.frags * 0.4)+" (60% off) \n You have: "+int(pPlayer.pev.frags) );
		else
			g_PlayerFuncs.HudMessage(pPlayer, FragsCountHudText,"Cost: "+int(self.pev.frags)+"\n You have: "+int(pPlayer.pev.frags) );
	}
}