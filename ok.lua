_G.Active = false
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Loco-CTO/UI-Library/main/VisionLibV2/source.lua'))()

Window = Library:Create({
	Name = "Vision UI Lib v2",
	Footer = "By Loco_CTO, Sius and BruhOOFBoi",
	ToggleKey = Enum.KeyCode.RightShift,
	LoadedCallback = function()
		Window:TaskBarOnly(false)
	end,
	KeySystem = true,
	Key = "superleaguesoccer",
	MaxAttempts = 5,
	DiscordLink = nil,
})

Window:ChangeTogglekey(Enum.KeyCode.RightShift)

local Tab = Window:Tab({
	Name = "superleaguesoccer ac bypass",
	Icon = "rbxassetid://11396131982",
	Color = Color3.new(1, 0, 0)
})

local Section1 = Tab:Section({
	Name = "Basic controls"
})

local Label = Section1:Label({
	Name = "fr\fr",
})

Label:SetName("hi guys so this is just ac bypass\n\n made by lightsoutfr(on discord), dm for inquiries\n\n\nall u do is press ac bypass button first then change walkspeed with drag! make sure ur in the stadium first")


local Button = Section1:Button({
	Name = "ac bypass pls press this first so u dont get ur ass banned",
	Callback = function()
		Library:Notify({
			Name = "Button",
			Text = "Clicked",
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
        
        
        local old;
old = hookmetamethod(game, "__namecall", function(self, ...)
    local args = { ... }
    local method = getnamecallmethod()

    if method == "FireServer" and self.Name == "Popup" then
        return
    end

    
    return old(self, ...)
end)
        print"nword"
        game:GetService("StarterPlayer").StarterPlayerScripts.LocalMain.Loaded.SetWalkspeed:Destroy()
        game:GetService("Players").LocalPlayer.PlayerScripts.LocalMain.Loaded.SetWalkspeed:Destroy()
    
end})



local Section2 = Tab:Section({
	Name = "Set WalkSpeed"
})

local Slider = Section2:Slider({
	Name = "walkspeed changer fr",
	Max = 50,
	Min = 0,
	Default = 25,
	Callback = function(Number)
		Library:Notify({
			Name = "Slider",
			Text = tostring(Number),
			Icon = "rbxassetid://11401835376",
			Duration = 3
		})
        local LocalPlayer = tostring(game:GetService("Players").LocalPlayer:GetFullName())
        local n = string.sub(LocalPlayer,9)
        _G.Debug = false
        if Workspace:FindFirstChild("Lobby") == nil then

            _G.Debug = true
        else
            _G.Active = true
        end
        if _G.Debug == true then
            if Workspace.Characters.Lobby:FindFirstChild(n) == nil then

                _G.Active = true

            end
        end

        if _G.Active == true then
        Workspace.Characters.Stadium[n].Humanoid.WalkSpeed = Number
        end
	end
})







Library:Notify({
	Name = "Test",
	Text = "This is just a test",
	Icon = "rbxassetid://11401835376",
	Duration = 3,
	Callback = function()
		Library:Notify({
			Name = "Em",
			Text = "Notify Callback",
			Icon = "rbxassetid://11401835376",
			Duration = 3,
		})
	end
})

local Tab = Window:Tab({
	Name = "Others",
	Icon = "rbxassetid://11476626403",
	Color = Color3.new(0.474509, 0.474509, 0.474509)
})

local Section = Tab:Section({
	Name = "Miscs"
})

local Button = Section:Button({
	Name = "Destroy library",
	Callback = function()
		Library:Destroy()
	end
})

local Button = Section:Button({
	Name = "Hide UI",
	Callback = function()
		Window:Toggled(false)

		task.wait(3)

		Window:Toggled(true)
	end
})

local Button = Section:Button({
	Name = "Task Bar Only",
	Callback = function()
		Window:TaskBarOnly(true)

		task.wait(3)

		Window:TaskBarOnly(false)
	end
})