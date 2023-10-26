-- KnockbackModule

local KnockbackModule = {}

-- Function for knockback in a specified direction
local function applyKnockbackDirection(entity, direction, speed, duration)
	local character = entity:IsA("Player") and entity.Character or entity
	if not character then
		return
	end

	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then
		return
	end

	-- Check if the entity is already knocked before applying the knockback
	if entity:FindFirstChild("knocked") then
		return
	end

	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then
		return
	end

	local knockedValue = Instance.new("BoolValue")
	knockedValue.Name = "knocked"
	knockedValue.Value = true
	knockedValue.Parent = entity

	local BV = Instance.new("BodyVelocity")
	BV.P = math.huge
	BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	BV.Velocity = direction.unit * speed
	BV.Parent = humanoidRootPart

	local originalWalkSpeed = humanoid.WalkSpeed
	humanoid.WalkSpeed = 0 -- Disable movement during knockback

	game.Debris:AddItem(BV, duration)

	wait(duration)
	humanoid.WalkSpeed = originalWalkSpeed -- Restore movement
	knockedValue:Destroy() -- Remove the "knocked" value
end

-- Function for knockback by player's look vector
local function applyKnockbackLookVector(entity, speed, duration)
	local character = entity:IsA("Player") and entity.Character or entity
	if not character then
		return
	end

	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then
		return
	end

	-- Check if the entity is already knocked before applying the knockback
	if entity:FindFirstChild("knocked") then
		return
	end

	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then
		return
	end

	local knockedValue = Instance.new("BoolValue")
	knockedValue.Name = "knocked"
	knockedValue.Value = true
	knockedValue.Parent = entity

	local BV = Instance.new("BodyVelocity")
	BV.P = math.huge
	BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	BV.Velocity = humanoidRootPart.CFrame.lookVector * speed
	BV.Parent = humanoidRootPart

	local originalWalkSpeed = humanoid.WalkSpeed
	humanoid.WalkSpeed = 0 -- Disable movement during knockback

	game.Debris:AddItem(BV, duration)

	wait(duration)
	humanoid.WalkSpeed = originalWalkSpeed -- Restore movement
	knockedValue:Destroy() -- Remove the "knocked" value
end

-- Function for knockback in a specified direction combined with look vector
local function applyCombinedKnockback(entity, direction, additionalDirection, speed, duration)
	local character = entity:IsA("Player") and entity.Character or entity
	if not character then
		return
	end

	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then
		return
	end

	-- Check if the entity is already knocked before applying the knockback
	if entity:FindFirstChild("knocked") then
		return
	end

	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then
		return
	end

	local knockedValue = Instance.new("BoolValue")
	knockedValue.Name = "knocked"
	knockedValue.Value = true
	knockedValue.Parent = entity

	local lookDirection = humanoidRootPart.CFrame.lookVector
	local combinedDirection = (lookDirection + additionalDirection).unit

	local BV = Instance.new("BodyVelocity")
	BV.P = math.huge
	BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	BV.Velocity = combinedDirection * speed
	BV.Parent = humanoidRootPart

	local originalWalkSpeed = humanoid.WalkSpeed
	humanoid.WalkSpeed = 0 -- Disable movement during knockback

	game.Debris:AddItem(BV, duration)

	wait(duration)
	humanoid.WalkSpeed = originalWalkSpeed -- Restore movement
	knockedValue:Destroy() -- Remove the "knocked" value
end

KnockbackModule.ApplyKnockbackDirection = applyKnockbackDirection
KnockbackModule.ApplyKnockbackLookVector = applyKnockbackLookVector
KnockbackModule.ApplyCombinedKnockback = applyCombinedKnockback

return KnockbackModule
