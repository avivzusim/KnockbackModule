# KnockbackModule Documentation

## Overview

The `KnockbackModule` is a module for Roblox that provides a set of functions for applying knockback effects to players and character dummies in your game. Knockback is a common game mechanic used to push characters or players away from a specific point or in a specific direction.

## Table of Contents

- Functions
  - applyKnockbackDirection
  - applyKnockbackLookVector
  - applyCombinedKnockback

- Usage
- Example
- Notes
- Contact

## Functions

### applyKnockbackDirection

- Applies knockback to an entity (player or character dummy) in a specified direction.
- **Parameters**:
  - `entity` (Instance): The entity to apply knockback to.
  - `direction` (Vector3): The direction in which the entity will be knocked back.
  - `speed` (number): The speed at which the entity is knocked back.
  - `duration` (number): The duration of the knockback effect.

### applyKnockbackLookVector

- Applies knockback to an entity (player or character dummy) based on the entity's look vector.
- **Parameters**:
  - `entity` (Instance): The entity to apply knockback to.
  - `speed` (number): The speed at which the entity is knocked back.
  - `duration` (number): The duration of the knockback effect.

### applyCombinedKnockback

- Applies knockback to an entity (player or character dummy) in a specified direction combined with its look vector.
- **Parameters**:
  - `entity` (Instance): The entity to apply knockback to.
  - `direction` (Vector3): The primary direction in which the entity is knocked back.
  - `additionalDirection` (Vector3): An additional direction to combine with the look vector.
  - `speed` (number): The speed at which the entity is knocked back.
  - `duration` (number): The duration of the knockback effect.

### knocked (BoolValue)

- A boolean value that is set to `true` while the entity is being knocked back. It prevents additional knockback effects while the entity is already knocked.

## Usage

1. Import the `KnockbackModule` into your game.

2. Use the provided functions to apply knockback to players or character dummies.

3. The `knocked` value prevents reapplying the knockback effect to an entity that is already in the process of being knocked back.

## Example

Apply knockback to a player:
```lua
local player = game.Players.LocalPlayer
local direction = Vector3.new(0, 0, 1) # Forward
local speed = 45
local duration = 0.5
KnockbackModule.applyKnockbackDirection(player, direction, speed, duration)
```

Apply knockback to a player by LookVector

```lua
-- Load the KnockbackModule
local KnockbackModule = require(game.ServerScriptService.KnockbackModule)

-- Function to apply knockback when a player is added
local function onPlayerAdded(player)
    wait(3) -- Optional delay before applying knockback
    
    -- Specify the desired speed and duration for knockback
    local speed = 45
    local duration = 5
    
    -- Apply the knockback using the player's look vector
    KnockbackModule.ApplyKnockbackLookVector(player, speed, duration)
end

-- Connect the function to the PlayerAdded event
game.Players.PlayerAdded:Connect(onPlayerAdded)
```

Apply knockback to a player by both a primary knockback direction and an additional direction to combine with the player's look vector

```lua
-- Load the KnockbackModule
local KnockbackModule = require(game.ServerScriptService.KnockbackModule)

-- Function to apply combined knockback when a player is added
local function onPlayerAdded(player)
    wait(3) -- Optional delay before applying knockback
    
    -- Specify the desired speed and duration for knockback
    local speed = 45
    local duration = 5
    
    -- Primary knockback direction (e.g., forward)
    local primaryDirection = Vector3.new(0, 0, 1)
    
    -- Additional knockback direction (e.g., right)
    local additionalDirection = Vector3.new(1, 0, 0)
    
    -- Apply the combined knockback
    KnockbackModule.ApplyCombinedKnockback(player, primaryDirection, additionalDirection, speed, duration)
end

-- Connect the function to the PlayerAdded event
game.Players.PlayerAdded:Connect(onPlayerAdded)
```

## Notes
The module provides a convenient way to implement knockback mechanics in your Roblox game, whether for combat, abilities, or other in-game events.
The duration parameter controls how long the knockback effect lasts.
It is important to manage when and how often you apply knockback effects to maintain balanced gameplay.

## Contact
```
Discord: mashgiach
```

