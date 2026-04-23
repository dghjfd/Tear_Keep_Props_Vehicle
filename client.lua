-- ============================================
-- Tear Keep Props Vehicle - 主脚本
-- Main Script for Keep Props in Vehicle System
-- ============================================

-- 状态变量 / State Variables
local savedProps = {
    hat = { drawable = -1, texture = -1 },
    glasses = { drawable = -1, texture = -1 },
    ear = { drawable = -1, texture = -1 },
}

local savedComponents = {
    backpack = { drawable = -1, texture = -1 },
    parachute = { torsoDrawable = -1, torsoTexture = -1, bagDrawable = -1, bagTexture = -1 },
}

local isInVehicle = false
local propsApplied = false

-- 调试日志函数 / Debug Log Function
local function DebugLog(message, logType)
    if not Config.DebugMode then return end
    
    local color = Config.LogColors.Info
    if logType == "warning" then
        color = Config.LogColors.Warning
    elseif logType == "error" then
        color = Config.LogColors.Error
    elseif logType == "debug" then
        color = Config.LogColors.Debug
    elseif logType == "success" then
        color = Config.LogColors.Success
    end
    
    -- 输出到F8控制台 / Output to F8 console
    print(string.format("%s [Tear_Keep_Props_Vehicle] %s", color, message))
end

-- 保存当前配件信息 / Save current prop information
local function SaveProps()
    local ped = PlayerPedId()
    
    -- 保存帽子 / Save hat (Prop ID 0)
    if Config.Features.KeepHat then
        local hatDrawable = GetPedPropIndex(ped, 0)
        local hatTexture = GetPedPropTextureIndex(ped, 0)
        if hatDrawable ~= -1 then
            savedProps.hat.drawable = hatDrawable
            savedProps.hat.texture = hatTexture
            DebugLog(string.format("保存帽子: drawable=%d, texture=%d", hatDrawable, hatTexture), "debug")
        end
    end
    
    -- 保存眼镜 / Save glasses (Prop ID 1)
    if Config.Features.KeepGlasses then
        local glassesDrawable = GetPedPropIndex(ped, 1)
        local glassesTexture = GetPedPropTextureIndex(ped, 1)
        if glassesDrawable ~= -1 then
            savedProps.glasses.drawable = glassesDrawable
            savedProps.glasses.texture = glassesTexture
            DebugLog(string.format("保存眼镜: drawable=%d, texture=%d", glassesDrawable, glassesTexture), "debug")
        end
    end
    
    -- 保存耳朵饰品 / Save ear accessories (Prop ID 2)
    if Config.Features.KeepEar then
        local earDrawable = GetPedPropIndex(ped, 2)
        local earTexture = GetPedPropTextureIndex(ped, 2)
        if earDrawable ~= -1 then
            savedProps.ear.drawable = earDrawable
            savedProps.ear.texture = earTexture
            DebugLog(string.format("保存耳朵饰品: drawable=%d, texture=%d", earDrawable, earTexture), "debug")
        end
    end
    
    -- 保存背包 / Save backpack (Component ID 5)
    if Config.Features.KeepBackpack then
        local bagDrawable = GetPedDrawableVariation(ped, 5)
        local bagTexture = GetPedTextureVariation(ped, 5)
        if bagDrawable ~= -1 then
            savedComponents.backpack.drawable = bagDrawable
            savedComponents.backpack.texture = bagTexture
            DebugLog(string.format("保存背包: drawable=%d, texture=%d", bagDrawable, bagTexture), "debug")
        end
    end
    
    -- 保存降落伞 / Save parachute (Component ID 3 + 5)
    if Config.Features.KeepParachute then
        local torsoDrawable = GetPedDrawableVariation(ped, 3)
        local torsoTexture = GetPedTextureVariation(ped, 3)
        local bagDrawable = GetPedDrawableVariation(ped, 5)
        local bagTexture = GetPedTextureVariation(ped, 5)
        
        -- 检查是否有降落伞 / Check if player has parachute
        if HasPedGotWeapon(ped, joaat("GADGET_PARACHUTE"), false) then
            savedComponents.parachute.torsoDrawable = torsoDrawable
            savedComponents.parachute.torsoTexture = torsoTexture
            savedComponents.parachute.bagDrawable = bagDrawable
            savedComponents.parachute.bagTexture = bagTexture
            DebugLog("保存降落伞信息", "debug")
        end
    end
end

-- 应用配件到玩家 / Apply props to player
local function ApplyProps()
    local ped = PlayerPedId()
    
    -- 应用帽子 / Apply hat (Prop ID 0)
    if Config.Features.KeepHat and savedProps.hat.drawable ~= -1 then
        SetPedPropIndex(ped, 0, savedProps.hat.drawable, savedProps.hat.texture, false)
        DebugLog(string.format("应用帽子: drawable=%d, texture=%d", savedProps.hat.drawable, savedProps.hat.texture), "debug")
    end
    
    -- 应用眼镜 / Apply glasses (Prop ID 1)
    if Config.Features.KeepGlasses and savedProps.glasses.drawable ~= -1 then
        SetPedPropIndex(ped, 1, savedProps.glasses.drawable, savedProps.glasses.texture, false)
        DebugLog(string.format("应用眼镜: drawable=%d, texture=%d", savedProps.glasses.drawable, savedProps.glasses.texture), "debug")
    end
    
    -- 应用耳朵饰品 / Apply ear accessories (Prop ID 2)
    if Config.Features.KeepEar and savedProps.ear.drawable ~= -1 then
        SetPedPropIndex(ped, 2, savedProps.ear.drawable, savedProps.ear.texture, false)
        DebugLog(string.format("应用耳朵饰品: drawable=%d, texture=%d", savedProps.ear.drawable, savedProps.ear.texture), "debug")
    end
    
    -- 应用背包 / Apply backpack (Component ID 5)
    if Config.Features.KeepBackpack and savedComponents.backpack.drawable ~= -1 then
        SetPedComponentVariation(ped, 5, savedComponents.backpack.drawable, savedComponents.backpack.texture, 0)
        DebugLog(string.format("应用背包: drawable=%d, texture=%d", savedComponents.backpack.drawable, savedComponents.backpack.texture), "debug")
    end
    
    -- 应用降落伞 / Apply parachute (Component ID 3 + 5)
    if Config.Features.KeepParachute and savedComponents.parachute.torsoDrawable ~= -1 then
        SetPedComponentVariation(ped, 3, savedComponents.parachute.torsoDrawable, savedComponents.parachute.torsoTexture, 0)
        SetPedComponentVariation(ped, 5, savedComponents.parachute.bagDrawable, savedComponents.parachute.bagTexture, 0)
        DebugLog("应用降落伞", "debug")
    end
    
    propsApplied = true
    DebugLog("所有配件已重新应用", "success")
end

-- 清除保存的配件信息 / Clear saved prop information
local function ClearSavedProps()
    savedProps.hat = { drawable = -1, texture = -1 }
    savedProps.glasses = { drawable = -1, texture = -1 }
    savedProps.ear = { drawable = -1, texture = -1 }
    savedComponents.backpack = { drawable = -1, texture = -1 }
    savedComponents.parachute = { torsoDrawable = -1, torsoTexture = -1, bagDrawable = -1, bagTexture = -1 }
    propsApplied = false
end

-- 主循环 / Main Loop
Citizen.CreateThread(function()
    DebugLog("车内保留配件系统已启动 / Keep Props in Vehicle system started", "success")
    
    while true do
        local ped = PlayerPedId()
        
        -- 确保玩家存在 / Ensure player exists
        if ped and DoesEntityExist(ped) then
            local currentlyInVehicle = IsPedInAnyVehicle(ped, false)
            
            -- 检测进入车辆 / Detect entering vehicle
            if currentlyInVehicle and not isInVehicle then
                isInVehicle = true
                DebugLog("玩家进入车辆，保存配件信息", "info")
                SaveProps()
            end
            
            -- 在车内时持续应用配件 / Continuously apply props while in vehicle
            if isInVehicle and currentlyInVehicle then
                if not propsApplied then
                    DebugLog("在车内，重新应用配件...", "info")
                    ApplyProps()
                end
            end
            
            -- 检测离开车辆 / Detect leaving vehicle
            if not currentlyInVehicle and isInVehicle then
                isInVehicle = false
                propsApplied = false
                DebugLog("玩家离开车辆，清除保存的配件信息", "info")
                ClearSavedProps()
            end
        end
        
        -- 循环间隔 / Loop interval
        Wait(Config.CheckInterval)
    end
end)

-- 资源卸载事件 / Resource stop event
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        DebugLog("资源已停止，清理完成 / Resource stopped, cleanup complete", "info")
    end
end)
