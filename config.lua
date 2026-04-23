-- ============================================
-- Tear Keep Props Vehicle - 配置文件
-- Configuration File for Keep Props in Vehicle
-- ============================================

Config = {}

-- 调试模式 / Debug Mode
-- 设置为 true 可在F8控制台和TX控制台查看详细日志
-- Set to true to see detailed logs in F8 console and TX console
Config.DebugMode = true

-- 功能开关 / Feature Toggles
Config.Features = {
    -- 帽子/头盔 / Hats and Helmets (Prop ID 0)
    KeepHat = true,
    
    -- 眼镜 / Glasses (Prop ID 1)
    KeepGlasses = true,
    
    -- 耳朵饰品 / Ear Accessories (Prop ID 2)
    KeepEar = true,
    
    -- 背包 / Backpacks (Component ID 5)
    KeepBackpack = true,
    
    -- 降落伞 / Parachute (Component ID 3 + 5)
    KeepParachute = true,
}

-- 检测间隔（毫秒）/ Detection interval in milliseconds
-- 越低越精确，但性能消耗越大
-- Lower = more accurate, but higher performance cost
Config.CheckInterval = 100

-- 日志颜色设置 / Log Color Settings (用于TX控制台)
Config.LogColors = {
    Info = "^4[INFO]^7",      -- 蓝色 / Blue
    Warning = "^3[WARN]^7",   -- 黄色 / Yellow
    Error = "^1[ERROR]^7",    -- 红色 / Red
    Debug = "^5[DEBUG]^7",    -- 紫色 / Purple
    Success = "^2[SUCCESS]^7" -- 绿色 / Green
}

-- 组件ID对照表 / Component ID Reference
-- 0 = 脸部 / Face
-- 1 = 面具 / Masks
-- 2 = 头发 / Hair
-- 3 = 躯干1（降落伞背带）/ Torso 1 (Parachute harness)
-- 4 = 腿部 / Legs
-- 5 = 背包/降落伞包 / Bags/Parachute bag
-- 6 = 鞋子 / Shoes
-- 7 = 围巾/项链 / Scarfs
-- 8 = 配饰1 / Accessory 1
-- 9 = 配饰2 / Accessory 2
-- 10 = 贴纸 / Decals
-- 11 = 躯干2 / Torso 2

-- 配件ID对照表 / Prop ID Reference
-- 0 = 帽子/头盔 / Hats and Helmets
-- 1 = 眼镜 / Glasses
-- 2 = 耳朵饰品 / Ear Accessories
