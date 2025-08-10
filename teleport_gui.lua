-- Teleport to Base GUI Script
-- By RoboLOx

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local basePosition = nil

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BaseTeleportGUI"
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Position = UDim2.new(0.5, -125, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 2
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner", Frame)

-- Title
local Title = Instance.new("TextLabel")
Title.Text = "🏠 Base Teleport"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Parent = Frame

-- Set Base Button
local SetBaseBtn = Instance.new("TextButton")
SetBaseBtn.Text = "📍 Set Base Position"
SetBaseBtn.Size = UDim2.new(1, -20, 0, 40)
SetBaseBtn.Position = UDim2.new(0, 10, 0, 40)
SetBaseBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
SetBaseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SetBaseBtn.Parent = Frame

-- Teleport Button
local TeleportBtn = Instance.new("TextButton")
TeleportBtn.Text = "🚀 Teleport to Base"
TeleportBtn.Size = UDim2.new(1, -20, 0, 40)
TeleportBtn.Position = UDim2.new(0, 10, 0, 90)
TeleportBtn.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
TeleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportBtn.Parent = Frame

-- Functions
SetBaseBtn.MouseButton1Click:Connect(function()
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		basePosition = player.Character.HumanoidRootPart.CFrame
		print("[BaseTeleport] Base position set!")
	end
end)

TeleportBtn.MouseButton1Click:Connect(function()
	if basePosition and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		player.Character.HumanoidRootPart.CFrame = basePosition
	else
		warn("[BaseTeleport] Base position not set!")
	end
end)
