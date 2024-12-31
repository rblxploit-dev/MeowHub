--// Services
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

--// Variables
local localPlayer = Players.LocalPlayer
local infiniteJumpToggle = false
local supportedGames = { [606849621] = "Jailbreak", [142823291] = "Murder Mystery 2", [10449761463] = "The Strongest Battlegrounds" }
local RAW = game:HttpGet("https://raw.githubusercontent.com/rblxploit-dev/MeowHub/refs/heads/main/meowhub.luau")
local UpdateDetector = true
local UpdateInterval = 120
local BrodcastEnabled = true
local BrodcastInterval = 120

--// Functions
function getGameName()
   return supportedGames[game.PlaceId] or nil
end

function notify(title, content, duration, image)
   Rayfield:Notify({
      Title = title,
      Content = content,
      Duration = duration,
      Image = image,
   })
end

function insertSeparator(input)
   return "̌⁥̌⁥̌⁥ ⁥ ॓᳚ ⁥ ⁥ ⁥ ⁥̌⁥̌̌̌ ᳚᳚⁥ť⁥⁥ ⁥" .. input
end

function loadScript(url)
   local success, err = pcall(function()
      loadstring(game:HttpGet(url))()
   end)
   if not success then
      notify("MeowHub", "Error loading script: " .. err, 6.5, "shield-off")
   end
end

--// UI Setup
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "MeowHub",
   Icon = "Cat", -- Icon in Topbar
   LoadingTitle = "Meow Hub",
   LoadingSubtitle = "3 Games Supported + 10 Universal Scripts",
   Theme = "Default",
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,
   ConfigurationSaving = {
      Enabled = true,
      FileName = "MeowHub sData"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "MeowHub",
      Subtitle = "3 Games Supported + 10 Universal Scripts",
      Note = "Obtain a key",
      FileName = "CollarData",
      SaveKey = true,
      Key = {"Ninja"}
   }
})

local universalTab = Window:CreateTab("Universal", "Earth")
local universalSimpleSection = universalTab:CreateSection("Simple")

-- Infinite Jump
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

-- WalkSpeed Slider
local walkSpeedSlider = universalTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {0, 100},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "ws1",
   Callback = function(Value)
      localPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = Value
   end,
})

-- JumpPower Slider
local jumpPowerSlider = universalTab:CreateSlider({
   Name = "JumpPower",
   Range = {0, 200},
   Increment = 5,
   Suffix = "JumpPower",
   CurrentValue = 50,
   Flag = "jp1",
   Callback = function(Value)
      local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")
      if not humanoid.UseJumpPower then
         humanoid.JumpHeight = (Value ^ 2) / (2 * 196.2)
      else
         humanoid.JumpPower = Value
      end
   end,
})

-- Script Hubs Section
local scriptHubSection = universalTab:CreateSection("Script Hubs")

local infiniteYeildButton = universalTab:CreateButton({
   Name = "Infinite Yeild",
   Callback = function()
      loadScript('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source')
   end,
})

local quizButton = universalTab:CreateButton({
   Name = "QuizBot",
   Callback = function()
      loadScript('https://raw.githubusercontent.com/Damian-11/quizbot/master/quizbot.luau')
   end,
})

-- Debugging Suite
local debuggingSection = universalTab:CreateSection("Debugging Suite")

local dexButton = universalTab:CreateButton({
   Name = "Dex",
   Callback = function()
      loadScript('https://raw.githubusercontent.com/infyiff/backup/main/dex.lua')
   end,
})

local remoteSpyButton = universalTab:CreateButton({
   Name = "Remote Spy",
   Callback = function()
      loadScript("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua")
   end,
})

-- Game-Specific Features
local function loadGameScripts()
   local gameName = getGameName()

   if gameName == "Jailbreak" then
      local gameTab = Window:CreateTab("Jailbreak", "columns-4")
      local gameSection = gameTab:CreateSection("Script Hubs")
      local AutoRob4Button = gameTab:CreateButton({
         Name = "Auto Rob v4",
         Callback = function()
            loadScript('http://scripts.projectauto.xyz/AutoRobV4')
         end,
      })
      -- Add other Jailbreak-specific buttons here...
   elseif gameName == "Murder Mystery 2" then
      local gameTab = Window:CreateTab("Murder Mystery 2", "slice")
      local gameSection = gameTab:CreateSection("Script Hubs")
      local YARHMButton = gameTab:CreateButton({
         Name = "YARHM",
         Callback = function()
            loadScript("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/source/yarhm/1.18/yarhm.lua")
         end,
      })
   elseif gameName == "The Strongest Battlegrounds" then
      local gameTab = Window:CreateTab("The Strongest Battlegrounds", "biceps-flexed")
      local gameSection = gameTab:CreateSection("Script Hubs")
      local YARHMButton = gameTab:CreateButton({
         Name = "Kade Hub",
         Callback = function()
            loadScript("https://raw.githubusercontent.com/skibiditoiletfan2007/KadeHubRepository/main/Latest.lua")
         end,
      })
   end
end

-- Check for Updates
coroutine.resume(coroutine.create(function()
   while task.wait(UpdateInterval) do
      if game:HttpGet("https://raw.githubusercontent.com/rblxploit-dev/MeowHub/refs/heads/main/meowhub.luau") ~= RAW and UpdateDetector then
         notify("MeowHub", "New Update Detected. Re-execute the script to apply.", 6.5, "shield-alert")
      end
   end
end))

-- Brodcast
coroutine.resume(coroutine.create(function()
   while task.wait(BrodcastInterval) do
      if BrodcastEnabled then
	  	if math.random(1, 2) == 1 then
		  print("MeowHub 🔛🔝")
		else
		  print("--> MeowHub <--")
		end
	  end
   end
end))

-- Settings Tab for Update Detector
local settingsTab = Window:CreateTab("Settings", "file-cog")
local updateSection = settingsTab:CreateSection("Update Detector")

local noticeEnableToggle = settingsTab:CreateToggle({
   Name = "Detector Enabled",
   CurrentValue = false,
   Flag = "updd",
   Callback = function(Value)
      UpdateDetector = Value
   end,
})

local updateIntervalSlider = settingsTab:CreateSlider({
   Name = "Checker Interval",
   Range = {10, 600},
   Increment = 10,
   Suffix = "Seconds",
   CurrentValue = 120,
   Flag = "cis1",
   Callback = function(Value)
      UpdateInterval = Value
   end,
})

local BrodcastSection = settingsTab:CreateSection("Chat Brodcast")

local noticeEnableToggle = settingsTab:CreateToggle({
   Name = "Brodcast Enabled",
   CurrentValue = false,
   Flag = "be1",
   Callback = function(Value)
      BrodcastEnabled = Value
   end,
})

local updateIntervalSlider = settingsTab:CreateSlider({
   Name = "Brodcast Interval",
   Range = {10, 600},
   Increment = 10,
   Suffix = "Seconds",
   CurrentValue = 120,
   Flag = "bri1",
   Callback = function(Value)
      BrodcastInterval = Value
   end,
})

-- Initialize Game Scripts Based on Game Detection
loadGameScripts()

-- Notify Completion
notify("MeowHub", "Finished Loading.", 6.5, "shield-check")
