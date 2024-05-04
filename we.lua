if game.PlaceId == 286090429 then
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Arsenal Script Hub - Arsenal", HidePremium = false,IntroEnabled = "Arsenal Hub", SaveConfig = true, ConfigFolder = "ArsenalConfig"})


-- Tabs
local AimbotTab = Window:MakeTab({
    Name = "Aimbot",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})


-- Tabs
local EspTab = Window:MakeTab({
    Name = "Esp",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Toggles
AimbotTab:AddToggle({
    Name = "Aimbot!",
    Default = false,
    Callback = function(Value)
	--// Services
		local RunService = game:GetService("RunService")
		local UserInputService = game:GetService("UserInputService")

--// Variables
		local aimbotEnabled = false
		local teamCheck = true
		local fov = 150
		local smoothing = 1

		--// Drawing
		local FOVring = Drawing.new("Circle")
		FOVring.Visible = true
		FOVring.Thickness = 1.5
		FOVring.Radius = fov
		FOVring.Transparency = 1
		FOVring.Color = Color3.fromRGB(255, 128, 128)
		FOVring.Position = workspace.CurrentCamera.ViewportSize/2

--// Functions
		local function getClosest(cframe)
    		local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
    		local target = nil
    		local mag = math.huge

    		for _, player in pairs(game.Players:GetPlayers()) do
        		if player.Character and player.Character:FindFirstChild("Head") and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") and player ~= game.Players.LocalPlayer and (player.Team ~= game.Players.LocalPlayer.Team or not teamCheck) then
            		local magBuf = (player.Character.Head.Position - ray:ClosestPoint(player.Character.Head.Position)).Magnitude
            		if magBuf < mag then
                		mag = magBuf
                		target = player
            		end
        		end
    		end

    		return target
		end

		--// Aimbot Loop
		local function aimbotLoop()
    		if aimbotEnabled then
        		local cam = workspace.CurrentCamera
        		local zz = workspace.CurrentCamera.ViewportSize/2
        		local pressed = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
        		local localPlay = game.Players.LocalPlayer.Character

        		if pressed then
            		local Line = Drawing.new("Line")
            		local curTar = getClosest(cam.CFrame)
            		local ssHeadPoint = cam:WorldToScreenPoint(curTar.Character.Head.Position)
            		ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
            		if (ssHeadPoint - zz).Magnitude < fov then
                		workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position), smoothing)
            		end
        		end
    		end
		end

--// Toggle Callback
		AimbotTab:AddToggle({
    		Name = "Aimbot!",
    		Default = false,
    		Callback = function(Value)
        		aimbotEnabled = Value
        		if Value then
            		RunService.RenderStepped:Connect(aimbotLoop)
        		else
            		RunService.RenderStepped:Disconnect(aimbotLoop)
        		end
    		end
		})

		--// Remove FOVring on delete key press
		UserInputService.InputBegan:Connect(function(input)
    		if input.KeyCode == Enum.KeyCode.Delete then
        		FOVring:Remove()
    		end
		end)
        print(Value)
    end
})


-- Toggles
EspTab:AddToggle({
    Name = "Esp",
    Default = false,
    Callback = function(Value)
        print(Value)
    end
})

-- Toggles
AimbotTab:AddToggle({
    Name = "Fov Size!",
    Default = false,
    Callback = function(Value)
        print(Value)
    end
})

AimbotTab:AddSlider({
	Name = "Fov Scale",
	Min = 0,
	Max = 150,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "1 out of 150",
	Callback = function(Value)
		print(Value)
	end    
})

-- Tabs
local PlayerTab = Window:MakeTab({
    Name = "PlayerTab",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Toggles
EspTab:AddToggle({
    Name = "Box Esp",
    Default = false,
    Callback = function(Value)
        print(Value)
    end
})

PlayerTab:AddSlider({
	Name = "Speed Scale",
	Min = 16,
	Max = 400,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "1 out of 150",
	Callback = function(Value)
        getgenv().WalkSpeedValue = Value; --Enter your speed amount here
        local Player = game:service'Players'.LocalPlayer;
        Player.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
            Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
        end)
        Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
		print(Value)
	end    
})

PlayerTab:AddSlider({
	Name = "Jump Scale",
	Min = 0,
	Max = 150,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "1 out of 150",
	Callback = function(Value)
		print(Value)
	end    
})

-- Toggles
PlayerTab:AddToggle({
    Name = "Fly",
    Default = false,
    Callback = function(Value)
        print(Value)
    end
})

PlayerTab:AddSlider({
	Name = "Fly Speed",
	Min = 0,
	Max = 150,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "1 out of 150",
	Callback = function(Value)
		print(Value)
	end    
})

-- Tabs
local AutoSprayTab = Window:MakeTab({
    Name = "AutoSpray",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Toggles
AutoSprayTab:AddToggle({
    Name = "AutoSpray",
    Default = false,
    Callback = function(Value)
        print(Value)
    end
})

-- Toggles
AutoSprayTab:AddToggle({
    Name = "RGB Gun",
    Default = false,
    Callback = function(Value)
        print(Value)
    end
})   

-- Toggles
AutoSprayTab:AddToggle({
    Name = "Inf Ammo",
    Default = false,
    Callback = function(Value)
        print(Value)
    end
})  



    
end
OrionLib:Init()
