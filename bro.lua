local name1 = "PlayerKick"

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if not checkcaller() and self.Name == name1 and method == "FireServer" then
        args[1] = nil
        args[2] = nil
        return old(self, unpack(args))
    end

    return old(self, ...)
end)

setreadonly(mt, true)

local name2 = "ExploitN"

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
 
    if not checkcaller() and self.Name == name2 and method == "FireServer" then
        args[1] = nil
        args[2] = nil
        return old(self, unpack(args))
    end

    return old(self, ...)
end)

setreadonly(mt, true)

print'debug'

--// Cache

local getgenv, getnamecallmethod, hookmetamethod, newcclosure, checkcaller, stringlower = getgenv, getnamecallmethod, hookmetamethod, newcclosure, checkcaller, string.lower

--// Loaded check

if getgenv().ED_AntiKick then return end

--// Variables

local Players, StarterGui, OldNamecall = game:GetService("Players"), game:GetService("StarterGui")

--// Global Variables

getgenv().ED_AntiKick = {
	SendNotifications = false, -- Set to true if you want to get notified for every event
	CheckCaller = false -- Set to true if you want to disable kicking by other executed scripts
}

--// Main

OldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
	if (getgenv().ED_AntiKick.CheckCaller and not checkcaller() or true) and stringlower(getnamecallmethod()) == "kick" then
		if getgenv().ED_AntiKick.SendNotifications then
			print'ok'
		end

		return nil
	end

	return OldNamecall(...)
end))

if getgenv().ED_AntiKick.SendNotifications then
	print'loaded'
end






print'please work lightsoutfr best bypasser'
