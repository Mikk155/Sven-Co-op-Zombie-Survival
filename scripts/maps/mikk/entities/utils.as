namespace UTILS
{

// UTILS::InsideZone( player to be inside, brush/hullsizes reference);
bool InsideZone(CBaseEntity@ pInsider, CBaseEntity@ self)
{
	bool blInside = true;
	blInside = blInside && pInsider.pev.origin.x + pInsider.pev.maxs.x >= self.pev.origin.x + self.pev.mins.x;
	blInside = blInside && pInsider.pev.origin.y + pInsider.pev.maxs.y >= self.pev.origin.y + self.pev.mins.y;
	blInside = blInside && pInsider.pev.origin.z + pInsider.pev.maxs.z >= self.pev.origin.z + self.pev.mins.z;
	blInside = blInside && pInsider.pev.origin.x + pInsider.pev.mins.x <= self.pev.origin.x + self.pev.maxs.x;
	blInside = blInside && pInsider.pev.origin.y + pInsider.pev.mins.y <= self.pev.origin.y + self.pev.maxs.y;
	blInside = blInside && pInsider.pev.origin.z + pInsider.pev.mins.z <= self.pev.origin.z + self.pev.maxs.z;

	return blInside;
}

} // End of namespace