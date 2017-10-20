--多重箭函数
function DuoChongGongJi( keys )
 
        local caster = keys.caster
        local target = keys.target

        --只对远程有效
        if caster:IsRangedAttacker() then
                --获取攻击范围
                local radius = caster:GetAttackRange()
                local teams = DOTA_UNIT_TARGET_TEAM_ENEMY
                local types = DOTA_UNIT_TARGET_BASIC+DOTA_UNIT_TARGET_HERO+DOTA_UNIT_TARGET_BUILDING
                local flags = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES+DOTA_UNIT_TARGET_FLAG_NONE
                --获取周围的单位
                local group = FindUnitsInRadius(caster:GetTeamNumber(),caster:GetOrigin(),nil,radius,teams,types,flags,FIND_CLOSEST,true)
                --获取箭的数量
                local attack_count = keys.attack_count or 0
                --获取箭的特效
                local attack_effect = caster:GetRangedProjectileName() or "particles/units/heroes/hero_lina/lina_base_attack.vpcf"
                local attack_unit = {}
 
                --筛选离英雄最近的敌人
                for i,unit in pairs(group) do
                        if (#attack_unit)==attack_count then
                                break
                        end
 
                        if unit~=target then
                                if unit:IsAlive() then
                                        table.insert(attack_unit,unit)
                                end
                        end
                end
 
                for i,unit in pairs(attack_unit) do
                        local info =
                            {
                                    Target = unit,
                                    Source = caster,
                                    Ability = keys.ability,
                                    EffectName = attack_effect,
                                    bDodgeable = false,
                                    iMoveSpeed = caster:GetProjectileSpeed(),
                                    bProvidesVision = false,
                                    iVisionRadius = 0,
                                    iVisionTeamNumber = caster:GetTeamNumber(),
                                    iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1
                            }
                        projectile = ProjectileManager:CreateTrackingProjectile(info)
                end
        end
end

function DuoChongGongJiDamage( keys )
    local caster = keys.caster
    local target = keys.target
    --获取攻击伤害
    local attack_damage = caster:GetAverageTrueAttackDamage(nil)
    local damageTable = {victim=target,
    attacker=caster,
    damage_type=DAMAGE_TYPE_PHYSICAL,
    damage=attack_damage}
    ApplyDamage(damageTable)
end






--多重箭函数
function DuoChongGongJi_you( keys )
 
        local caster = keys.caster
        local target = keys.target
--只对远程有效
        if caster:IsRangedAttacker() then
                --获取攻击范围
                local radius = caster:GetAttackRange()
                local teams = DOTA_UNIT_TARGET_TEAM_ENEMY
                local types = DOTA_UNIT_TARGET_BASIC+DOTA_UNIT_TARGET_HERO+DOTA_UNIT_TARGET_BUILDING
                local flags = DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES+DOTA_UNIT_TARGET_FLAG_NONE
                --获取周围的单位
                local group = FindUnitsInRadius(caster:GetTeamNumber(),caster:GetOrigin(),nil,radius,teams,types,flags,FIND_CLOSEST,true)
                --获取箭的数量
                local attack_count = keys.attack_count or 0
                --获取箭的特效
                local attack_effect = caster:GetRangedProjectileName() or "particles/units/heroes/hero_razor/razor_static_link_projectile_a.vpcf"
                local attack_unit = {}
 
        --筛选离英雄最近的敌人
                for i,unit in pairs(group) do
                        if (#attack_unit)==attack_count then
                                break
                        end
 
                        if unit~=target then
                                if unit:IsAlive() then
                                        table.insert(attack_unit,unit)
                                end
                        end
                end
 
                for i,unit in pairs(attack_unit) do
                        local info =
                                                {
                                                        Target = unit,
                                                        Source = caster,
                                                        Ability = keys.ability,
                                                        EffectName = attack_effect,
                                                        bDodgeable = false,
                                                        iMoveSpeed = caster:GetProjectileSpeed(),
                                                        bProvidesVision = false,
                                                        iVisionRadius = 0,
                                                        iVisionTeamNumber = caster:GetTeamNumber(),
                                                        iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_ATTACK_1
                                                }
                        projectile = ProjectileManager:CreateTrackingProjectile(info)
 
                end
        end
end

function DuoChongGongJiDamage_you( keys )
    local caster = keys.caster
    local target = keys.target
    --获取攻击伤害
    local attack_damage = caster:GetAverageTrueAttackDamage(nil)
    local damageTable = {victim=target,
    attacker=caster,
    damage_type=DAMAGE_TYPE_PHYSICAL,
    damage=attack_damage}
    ApplyDamage(damageTable)
end