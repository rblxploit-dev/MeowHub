--// Services
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

--// Variables
local localPlayer = Players.LocalPlayer
local infiniteJumpToggle = false

local supported = "1 Game Supported + 10 Universal Scripts"

function GameName()
	if game.PlaceId == 606849621 then
		return "Jailbreak"
	end
	return nil
end

function insertSeparator(input)
--[[	local result = ""

	local original = "abcdefghijklmnopqrstuvwxyz"
	local modified = ".ͣ.b.ͨ..ͩ..ͤ.|̶͞..g.ͪ..ͥ.jk|͟͟....ͫ.🅽𝐨.ͦ.pq.ͬ.s.ͭ..ͧ..ͮ..ͮ.ͮ..ͯ.yz"
    -- Iterate through each character in the input string
    for i = 1, #input do
        local char = input:sub(i, i)  -- Get the current character
        
        -- Find the index of the character in the original string
        local index = original:find(char)
        
        -- If the character is found in the original string, replace it with the modified character
        if index then
            result = result .. modified:sub(index, index)
        else
            -- If the character is not found in the original string, keep it unchanged
            result = result .. char
        end
    end]]--

	

	return "̌⁥̌⁥̌⁥ ⁥ ॓᳚ ⁥ ⁥ ⁥ ⁥̌⁥̌̌̌ ᳚᳚⁥ť⁥⁥ ⁥" .. input
end

--// Ui Setup
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "MeowHub",
   Icon = "Cat", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Meow Hub",
   LoadingSubtitle = supported,
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "MeowHub sData"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "MeowHub",
      Subtitle = supported,
      Note = "Obtain a key", -- Use this to tell the user how to get a key
      FileName = "CollarData", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Ninja"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local universalTab = Window:CreateTab("Universal", "Earth")
local universalSimpleSection = universalTab:CreateSection("Simple")

local infiniteJumpButton = universalTab:CreateButton({
   Name = "Infinite Jump",
	Callback = function()
		infiniteJumpToggle = not infiniteJumpToggle
		UserInputService.InputBegan:Connect(function(Input, Processed)
			if Input.KeyCode == Enum.KeyCode.Space and infiniteJumpToggle and not Processed then
				localPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			end
		end)
	end,
})

local walkSpeedSlider = universalTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {0, 100},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "ws1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		localPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = Value
   end,
})

local jumpPowerSlider = universalTab:CreateSlider({
   Name = "JumpPower",
   Range = {0, 200},
   Increment = 5,
   Suffix = "JumpPower",
   CurrentValue = 50,
   Flag = "jp1",
   Callback = function(Value)
		if not localPlayer.Character:FindFirstChildOfClass("Humanoid").UseJumpPower then
			localPlayer.Character:FindFirstChildOfClass("Humanoid").JumpHeight = (Value ^ 2) / (2 * 196.2)
		else
			localPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = Value
		end
   end,                     
})

local scriptHubSection = universalTab:CreateSection("Script Hubs")

local infiniteYeildButton = universalTab:CreateButton({
   Name = "Infinite Yeild",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() 
	end,
})

local trollSection = universalTab:CreateSection("Troll")

local quizButton = universalTab:CreateButton({
   Name = "QuizBot",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Damian-11/quizbot/master/quizbot.luau'))() 
	end,
})

local debuggingSection = universalTab:CreateSection("Debugging Suite")

local dexButton = universalTab:CreateButton({
   Name = "Dex",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua'))() 
	end,
})

local remoteSpyButton = universalTab:CreateButton({
   Name = "Remote Spy",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))() 
	end,
})

local audioLoggerButton = universalTab:CreateButton({
   Name = "Audio Logger",
	Callback = function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/infyiff/backup/main/audiologger.lua'),true))()
	end,
})

local chatBypassSection = universalTab:CreateSection("Chat Bypass")

local CatBypassButton = universalTab:CreateButton({
   Name = "Cat Bypass (WARNING: HAS A KEYSYSTEM)",
	Callback = function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/shadow62x/catbypass/main/upfix'),true))()
	end,
})

local chatBypass2Section = universalTab:CreateSection("(Buggy) Local Chat Bypass")

local Input = universalTab:CreateInput({
   Name = "Message to send",
   CurrentValue = "",
   PlaceholderText = "Message",
   RemoveTextAfterFocusLost = false,
   Flag = "ufcm1",
   Callback = function(Text)
		CHAT_MESSAGE = Text
   end,
})

local chatBypassExecuteButton = universalTab:CreateButton({
   Name = "Send Message",
	Callback = function()
		if CHAT_MESSAGE and not CHAT_MESSAGE ~= "" and CHAT_MESSAGE ~= "Message" and CHAT_MESSAGE ~= " " then
			Rayfield:Notify({
				Title = "MeowHub",
				Content = "This feature is currently disabled due to bugs.",
				Duration = 6.5,
				Image = "shield-off",
			})
			--game:GetService("TextChatService").TextChannels:WaitForChild("RBXGeneral"):SendAsync(insertSeparator(CHAT_MESSAGE))
		else
			Rayfield:Notify({
				Title = "MeowHub",
				Content = "No chat message selected. Please type one in the area above.",
				Duration = 6.5,
				Image = "shield-alert",
			})
		end
	end,
})

if GameName() == nil then
	Rayfield:Notify({
		Title = "MeowHub",
		Content = "Unsupported game. Only loading universal module...",
		Duration = 6.5,
		Image = "shield-alert",
	})
elseif GameName() == "Jailbreak" then
	local gameTab = Window:CreateTab("Jailbreak", "columns-4")
	local scriptHubSection = gameTab:CreateSection("Script Hubs")

	local AutoRob4Button = gameTab:CreateButton({
	Name = "Auto Rob v4",
		Callback = function()
			loadstring(game:HttpGet('http://scripts.projectauto.xyz/AutoRobV4'))()
		end,
	})
	local AutoRob5Button = gameTab:CreateButton({
	Name = "Auto Rob v5 (WARNING: BETA)",
		Callback = function()
			loadstring(game:HttpGet('http://scripts.projectauto.xyz/AutoRobV4'))()
		end,
	})
	local AutoArrest3Button = gameTab:CreateButton({
	Name = "Auto Arrest v3 (WARNING: BETA)",
		Callback = function()
			loadstring(game:HttpGet('http://scripts.projectauto.xyz/AutoRobV4'))()
		end,
	})
	local AutoArrest4Button = gameTab:CreateButton({
	Name = "Auto Arrest v4 (WARNING: PAID, BETA)",
		Callback = function()
			loadstring(game:HttpGet('http://scripts.projectauto.xyz/AutoArrestV3'))()
		end,
	})
	local DropFarm2Button = gameTab:CreateButton({
	Name = "Drop Farm v2 (WARNING: PAID)",
		Callback = function()
			loadstring(game:HttpGet('http://scripts.projectauto.xyz/DropFarmV2'))()
		end,
	})
end
	Rayfield:Notify({
		Title = "MeowHub",
		Content = "Finished Loading.",
		Duration = 6.5,
		Image = "shield-check",
	})
