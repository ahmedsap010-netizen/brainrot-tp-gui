-- Teleport GUI with Dynamic Base Location
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local baseCFrame = nil -- هيتم تحديده من اللاعب

-- Anti-Teleport Reset
local function preventLagBack()
    local lastPos = humanoidRootPart.Position
    humanoidRootPart:GetPropertyChangedSignal("CFrame"):Connect(function()
        if (humanoidRootPart.Position - lastPos).Magnitude > 50 then
            task.wait(0.1)
            lastPos = humanoidRootPart.Position
        end
    end)
end
preventLagBack()

-- UI Creation
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 200)
Frame.Position = UDim2.new(0.5, -125, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 2
Frame.Visible = true

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Text = "Brainrot TP GUI"
Title.TextScaled = true

local SetBaseButton = Instance.new("TextButton", Frame)
SetBaseButton.Size = UDim2.new(1, -20, 0, 40)
SetBaseButton.Position = UDim2.new(0, 10, 0, 40)
SetBaseButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
SetBaseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SetBaseButton.Text = "Set Base Location"
SetBaseButton.TextScaled = true

local TeleportButton = Instance.new("TextButton", Frame)
TeleportButton.Size = UDim2.new(1, -20, 0, 40)
TeleportButton.Position = UDim2.new(0, 10, 0, 90)
TeleportButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.Text = "Teleport to Base"
TeleportButton.TextScaled = true

local CloseButton = Instance.new("TextButton", Frame)
CloseButton.Size = UDim2.new(1, -20, 0, 40)
CloseButton.Position = UDim2.new(0, 10, 0, 140)
CloseButton.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Text = "Close GUI"
CloseButton.TextScaled = true

-- Set Base Location
SetBaseButton.MouseButton1Click:Connect(function()
    baseCFrame = humanoidRootPart.CFrame
    SetBaseButton.Text = "Base Set!"
    SetBaseButton.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
end)

-- Teleport function
TeleportButton.MouseButton1Click:Connect(function()
    if baseCFrame then
        character = player.Character or player.CharacterAdded:Wait()
        humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        humanoidRootPart.Anchored = true
        humanoidRootPart.CFrame = baseCFrame
        task.wait(1.5)
        humanoidRootPart.Anchored = false
    else
        TeleportButton.Text = "Set Base First!"
        task.wait(1.5)
        TeleportButton.Text = "Teleport to Base"
    end
end)

-- Toggle GUI visibility
CloseButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)
