local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
getgenv().SecureMode = false

local Window = Rayfield:CreateWindow({
    Name = "Pork Hub",
    LoadingTitle = "Loading Pork Hub...",
    LoadingSubtitle = "Presented by John Pork",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Cotton Picker", -- Create a custom folder for your hub/game
       FileName = "Pork Hub"
    }
})

local Info = Window:CreateTab("Home", 4483362458)
local AutoFarm = Window:CreateTab("Auto Farm")

local function CollectGifts()
    for _,v in next, game:GetService("Players").LocalPlayer.PlayerGui.GUIs.Gifts.Main:GetChildren() do
        if v.ClassName == "TextButton" and v.Name == "Gift" and not v.Reward.Value:find("Pet") then
            game:GetService("ReplicatedStorage").Events.RemoteEvents.giftEvent:FireServer(v)
        end
    end
end

local function Rebirth()
    game:GetService("ReplicatedStorage").Events.RemoteEvents.Rebirth:FireServer()
end

local function Click()
    game:GetService("ReplicatedStorage").Events.RemoteEvents.processClicks:FireServer()
end

local AutoFarmSection = AutoFarm:CreateSection("Auto Farm")


AutoFarm:CreateToggle({
    Name = "Auto Claim Gifts",
    CurrentValue = false,
    Flag = "Toggle Claim Gifts", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        shared.Gifts = Value
        while shared.Gifts do
            task.wait()
            CollectGifts()
        end
    end,
 })

 AutoFarm:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = false,
    Flag = "Toggle Rebirth", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        shared.Rebirths = Value
        while shared.Rebirths do
            task.wait()
            Rebirth()
        end
    end,
 })

 AutoFarm:CreateToggle({
    Name = "Auto Click",
    CurrentValue = false,
    Flag = "Toggle Auto Click", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        shared.Clicks = Value
        while shared.Click do
            Click()
        end
    end,
 })





local Pets = Window:CreateTab("Pets")

local PetsHatching = Pets:CreateSection("Hatching")

