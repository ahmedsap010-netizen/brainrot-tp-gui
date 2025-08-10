-- Brainrot TP GUI (Base Teleport Script)
-- By AhmedSap Optimized

local player = game.Players.LocalPlayer
local basePosition = nil

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 150)
frame.Position = UDim2.new(0.05, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 2
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Brainrot Base TP"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = frame

-- Set Base Button
local setBaseBtn = Instance.new("TextButton")
setBaseBtn.Size = UDim2.new(1, 0, 0, 40)
setBaseBtn.Position = UDim2.new(0, 0, 0.3, 0)
setBaseBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
setBaseBtn.Text = "Set Base Location"
setBaseBtn.TextColor3 = Color3.new(1, 1, 1)
setBaseBtn.Font = Enum.Font.SourceSansBold
setBaseBtn.TextSize = 18
setBaseBtn.Parent = frame

setBaseBtn.MouseButton1Click:Connect(function()
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        basePosition = player.Character.HumanoidRootPart.CFrame
        print("[Base TP] Base location set!")
    end
end)

-- Teleport Button
local tpBtn = Instance.new("TextButton")
tpBtn.Size = UDim2.new(1, 0, 0, 40)
tpBtn.Position = UDim2.new(0, 0, 0.65, 0)
tpBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
tpBtn.Text = "Teleport to Base"
tpBtn.TextColor3 = Color3.new(1, 1, 1)
tpBtn.Font = Enum.Font.SourceSansBold
tpBtn.TextSize = 18
tpBtn.Parent = frame

tpBtn.MouseButton1Click:Connect(function()
    if basePosition and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = basePosition
        print("[Base TP] Teleported to base!")
    else
        warn("[Base TP] No base location set!")
    end
end)
