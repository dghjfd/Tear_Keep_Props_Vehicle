<div align="center">

# 🎒 Tear Keep Props Vehicle

### FiveM Vehicle Props Retention System

> Automatically keeps hats, glasses, backpacks, and parachutes visible when players enter vehicles

![Version](https://img.shields.io/badge/version-1.0.0-blue?style=for-the-badge)
![FiveM](https://img.shields.io/badge/FiveM-Compatible-f45d01?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)
![Lua](https://img.shields.io/badge/language-Lua-2C2D72?style=for-the-badge&logo=lua)

[📖 Documentation](#-configuration-guide) • [⚡ Quick Start](#-quick-start) • [🎯 Features](#-features) • [🛠️ Optimization](#-optimization-tips) • [🇨🇳 中文文档](README_zh.md)

</div>

---

## 🎯 Features

| Feature | Description |
|---------|-------------|
| 🎩 **Keep Hats** | Retains hats/helmets in vehicles |
| 👓 **Keep Glasses** | Retains eyewear in vehicles |
| 👂 **Keep Ear Props** | Retains ear accessories in vehicles |
| 🎒 **Keep Backpacks** | Retains backpacks in vehicles |
| 🪂 **Keep Parachute** | Retains parachute gear in vehicles |

---

## ⚡ Quick Start

### 📦 Installation

```bash
# 1. Download or clone this repository
# 2. Place in your server's resources folder
resources/[local]/Tear_Keep_Props_Vehicle/

# 3. Add to server.cfg
ensure Tear_Keep_Props_Vehicle

# 4. Restart server
```

---

## 📖 Configuration Guide

### ⚙️ Config File (`config.lua`)

```lua
-- Debug mode / Enable for console logs
Config.DebugMode = true

-- Feature toggles
Config.Features = {
    KeepHat = true,        -- Hats/helmets
    KeepGlasses = true,    -- Eyewear
    KeepEar = true,        -- Ear accessories
    KeepBackpack = true,   -- Backpacks
    KeepParachute = true,  -- Parachute gear
}

-- Check interval (milliseconds)
Config.CheckInterval = 100
```

### 🔧 Customization

| Option | Description | Default |
|--------|-------------|---------|
| `DebugMode` | Enable console logging | `true` |
| `KeepHat` | Keep hats in vehicles | `true` |
| `KeepGlasses` | Keep glasses in vehicles | `true` |
| `KeepEar` | Keep ear props in vehicles | `true` |
| `KeepBackpack` | Keep backpacks in vehicles | `true` |
| `KeepParachute` | Keep parachute gear | `true` |
| `CheckInterval` | Detection interval (ms) | `100` |

---

## 🛠️ Optimization Tips

### 📊 Performance

| Metric | Value |
|--------|-------|
| **Resmon** | ~0.01ms |
| **Loop Interval** | 100ms |
| **Memory Usage** | Minimal |

### 💡 Best Practices

1. **Disable unused features** - Set to `false` in config
2. **Increase interval** - Set `CheckInterval` to `200` for lower performance impact
3. **Use with other plugins** - Compatible with most FiveM resources

---

## 🎮 How It Works

```
1. Player enters vehicle
   ↓
2. Plugin saves current props/components
   ↓
3. Continuously re-applies props while in vehicle
   ↓
4. Player leaves vehicle
   ↓
5. Plugin clears saved data
```

---

## 📋 Component Reference

### Prop IDs
| ID | Type |
|----|------|
| 0 | Hats/Helmets |
| 1 | Glasses |
| 2 | Ear Accessories |

### Component IDs
| ID | Type |
|----|------|
| 3 | Torso 1 (Parachute harness) |
| 5 | Bags/Parachute bag |

---

## 🔗 Related Resources

- [Tear LEO Standby Animation](https://github.com/dghjfd/Tear_LEO_standby_animation) - Idle animation system
- [TEA-No_afk_cam](https://github.com/dghjfd/TEA-No_afk_cam) - AFK camera prevention

---

## 📄 License

This project is licensed under the MIT License.

---

<div align="center">

**Made with ❤️ by Tear**

[⭐ Star this repo](https://github.com/dghjfd/Tear_Keep_Props_Vehicle) • [🐛 Report Bug](https://github.com/dghjfd/Tear_Keep_Props_Vehicle/issues) • [💡 Request Feature](https://github.com/dghjfd/Tear_Keep_Props_Vehicle/issues)

</div>
