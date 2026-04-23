<div align="center">

# 🎒 Tear 车内保留配件系统

### 专业FiveM车内配件保留插件

> 玩家进入车辆时自动保留帽子、眼镜、背包、降落伞等配件，提升服务器沉浸感与真实感

![Version](https://img.shields.io/badge/version-1.0.0-blue?style=for-the-badge)
![FiveM](https://img.shields.io/badge/FiveM-Compatible-f45d01?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)
![Lua](https://img.shields.io/badge/language-Lua-2C2D72?style=for-the-badge&logo=lua)

[📖 配置教程](#-配置教程) • [⚡ 快速开始](#-快速开始) • [🎯 功能特性](#-功能特性) • [🛠️ 优化指南](#-优化指南) • [🇬🇧 English](README.md)

</div>

---

## 🎯 功能特性

| 功能 | 说明 |
|------|------|
| 🎩 **保留帽子** | 车内保留帽子/头盔 |
| 👓 **保留眼镜** | 车内保留眼镜 |
| 👂 **保留耳饰** | 车内保留耳朵饰品 |
| 🎒 **保留背包** | 车内保留背包 |
| 🪂 **保留降落伞** | 车内保留降落伞装备 |

---

## ⚡ 快速开始

### 📦 安装方法

```bash
# 1. 下载或克隆此仓库
# 2. 放入服务器资源文件夹
resources/[local]/Tear_Keep_Props_Vehicle/

# 3. 在 server.cfg 中添加
ensure Tear_Keep_Props_Vehicle

# 4. 重启服务器
```

---

## 📖 配置教程

### ⚙️ 配置文件（`config.lua`）

```lua
-- 调试模式 / 启用后在控制台查看日志
Config.DebugMode = true

-- 功能开关
Config.Features = {
    KeepHat = true,        -- 帽子/头盔
    KeepGlasses = true,    -- 眼镜
    KeepEar = true,        -- 耳朵饰品
    KeepBackpack = true,   -- 背包
    KeepParachute = true,  -- 降落伞装备
}

-- 检测间隔（毫秒）
Config.CheckInterval = 100
```

### 🔧 自定义选项

| 选项 | 说明 | 默认值 |
|------|------|--------|
| `DebugMode` | 启用控制台日志 | `true` |
| `KeepHat` | 车内保留帽子 | `true` |
| `KeepGlasses` | 车内保留眼镜 | `true` |
| `KeepEar` | 车内保留耳饰 | `true` |
| `KeepBackpack` | 车内保留背包 | `true` |
| `KeepParachute` | 车内保留降落伞 | `true` |
| `CheckInterval` | 检测间隔（毫秒） | `100` |

---

## 🛠️ 优化指南

### 📊 性能表现

| 指标 | 数值 |
|------|------|
| **资源占用** | ~0.01ms |
| **循环间隔** | 100毫秒 |
| **内存使用** | 极低 |

### 💡 最佳实践

1. **关闭不需要的功能** - 在配置文件中设置为 `false`
2. **增加检测间隔** - 将 `CheckInterval` 设置为 `200` 降低性能消耗
3. **与其他插件配合** - 兼容大多数FiveM资源

---

## 🎮 工作原理

```
1. 玩家进入车辆
   ↓
2. 插件保存当前配件信息
   ↓
3. 在车内时持续重新应用配件
   ↓
4. 玩家离开车辆
   ↓
5. 插件清除保存的数据
```

---

## 📋 组件参考

### 配件ID
| ID | 类型 |
|----|------|
| 0 | 帽子/头盔 |
| 1 | 眼镜 |
| 2 | 耳朵饰品 |

### 组件ID
| ID | 类型 |
|----|------|
| 3 | 躯干1（降落伞背带） |
| 5 | 背包/降落伞包 |

---

## 🔗 相关资源

- [Tear LEO 待机动画](https://github.com/dghjfd/Tear_LEO_standby_animation) - 待机动画系统
- [TEA-No_afk_cam](https://github.com/dghjfd/TEA-No_afk_cam) - AFK相机防止插件

---

## 📄 许可证

本项目采用 MIT 许可证。

---

<div align="center">

**由 Tear 用 ❤️ 制作**

[⭐ 给仓库加星](https://github.com/dghjfd/Tear_Keep_Props_Vehicle) • [🐛 报告Bug](https://github.com/dghjfd/Tear_Keep_Props_Vehicle/issues) • [💡 请求功能](https://github.com/dghjfd/Tear_Keep_Props_Vehicle/issues)

</div>
