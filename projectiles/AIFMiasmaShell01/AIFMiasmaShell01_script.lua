--
-- Aeon T2 Artillery Projectile : uab2303
--

local AMiasmaProjectile = import('/lua/aeonprojectiles.lua').AMiasmaProjectile
local utilities = import('/lua/utilities.lua')

AIFMiasmaShell01 = Class(AMiasmaProjectile) {
    OnImpact = function(self, targetType, targetEntity) 
        -- Sounds for all other impacts, ie: Impact<targetTypeName>
        local bp = self:GetBlueprint().Audio
        local snd = bp['Impact'.. targetType]
        local pos = self:GetPosition()
        local radius = self.DamageData.DamageRadius
		local FriendlyFire = self.DamageData.DamageFriendly
        
        if snd then
            self:PlaySound(snd)
            -- Generic Impact Sound
        elseif bp.Impact then
            self:PlaySound(bp.Impact)
        end
        
		self:CreateImpactEffects( self:GetArmy(), self.FxImpactNone, self.FxNoneHitScale )
		local x,y,z = self:GetVelocity()
		local speed = utilities.GetVectorLength(Vector(x*10,y*10,z*10))
		
		-- One initial projectile following same directional path as the original
        self:CreateChildProjectile('/projectiles/AIFMiasmaShell02/AIFMiasmaShell02_proj.bp' )
        :SetVelocity(x,y,z):SetVelocity(speed):PassDamageData(self.DamageData)
                
        self:Destroy()
        
        -- already kill the trees, so better make them fall. Even if it would be better that it doesn't kill trees at all.
        DamageArea( self, pos, radius, 1, 'Force', FriendlyFire )
        DamageArea( self, pos, radius, 1, 'Force', FriendlyFire )
        
        self.DamageData.DamageAmount = self.DamageData.DamageAmount - 2
        
        AMiasmaProjectile.OnImpact(self, targetType, targetEntity)
    end,
    
}

TypeClass = AIFMiasmaShell01