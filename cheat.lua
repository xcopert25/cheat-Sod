local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("MyGame Scripts", "RJTheme3")

-- Основная вкладка и секции
local mainTab = Window:NewTab("SOB")
local mainSection = mainTab:NewSection("Sans Omniverse Battle")

-- Автофам
mainSection:NewLabel("AutoFarm")

mainSection:NewButton("Autofarm", "Автоматический фейк", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xcopert25/cheat/refs/heads/main/сheat.lua"))()
end)

mainSection:NewButton("NewAutoFarm", "Новый автофам", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xcopert25/auto-farmdsadsada/refs/heads/main/faawrm.lua"))()
end)

mainSection:NewButton("Move Coins to Player", "Перемещение монет к игроку", function()
    coroutine.wrap(function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        while true do
            local coinsFolder = workspace:FindFirstChild("Coins")
            if coinsFolder then
                for _, coin in pairs(coinsFolder:GetChildren()) do
                    if coin:IsA("BasePart") then
                        coin.CFrame = humanoidRootPart.CFrame
                    end
                end
            end
            wait(0.1)
        end
    end)()
end)

-- Speed и Jump
mainSection:NewLabel("speed and jump cheat")
mainSection:NewSlider("Speedcheat", "speed 0-500", 500, 0, function(s)
    local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = s
    end
end)

mainSection:NewSlider("Jumpcheat", "Jump Power 0-250", 250, 0, function(s)
    local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = s
    end
end)

-- ESP
local espFolder = workspace:FindFirstChild("ESPFolder") or Instance.new("Folder", workspace)
espFolder.Name = "ESPFolder"

if not _G.ESPInitialized then
    _G.ESPInitialized = true
    spawn(function()
        while true do
            wait(0.5)
            local existingESP = {}
            for _, esp in pairs(espFolder:GetChildren()) do
                if esp.Name == "EspBox" then
                    existingESP[esp.Adornee] = esp
                end
            end
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= game.Players.LocalPlayer then
                    local hrp = player.Character.HumanoidRootPart
                    if not existingESP[hrp] then
                        local box = Instance.new("BoxHandleAdornment")
                        box.Adornee = hrp
                        box.Parent = espFolder
                        box.ZIndex = 0
                        box.Size = Vector3.new(4, 5, 1)
                        box.Transparency = 0.5
                        box.Color3 = Color3.fromRGB(255, 0, 0)
                        box.AlwaysOnTop = true
                        box.Name = "EspBox"
                    else
                        existingESP[hrp] = nil
                    end
                end
            end
            for _, esp in pairs(espFolder:GetChildren()) do
                if esp.Name == "EspBox" and existingESP[esp.Adornee] then
                    esp:Destroy()
                end
            end
        end
    end)
end

-- Телепорты
local TeleportTab = Window:NewTab("SOB teleport")
local TeleportSection = TeleportTab:NewSection("Sans Omniverse Battle teleport")

TeleportSection:NewLabel("teleport")

local function teleportTo(pos)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = pos
    end
end

local teleports = {
    {name = "Spawn", cframe = CFrame.new(-977.456665, 5.525108337, -52.3848114)},
    {name = "Spawn snowdin", cframe = CFrame.new(-1225.85461, 5.409351945, -55.4106445)},
    {name = "Spawn waterfall", cframe = CFrame.new(-1434.10889, 5.409351945, -55.4106445)},
    {name = "Spawn Hotland", cframe = CFrame.new(-1626.07422, 5.409351945, -55.4106445)},
    {name = "Spawn Beyond God (Have 4.4M)", cframe = CFrame.new(-1850.99866, 5.341791391, -55.4106445)},
    {name = "Snowdin 1", cframe = CFrame.new(-72.0665131, 5.5, -15.2218132)},
    {name = "Snowdin 2", cframe = CFrame.new(823.59613, 74.8315048, -20.296524)},
    {name = "Snowdin 3", cframe = CFrame.new(823.59613, 74.8315048, -20.29652455)},
    {name = "Goblins", cframe = CFrame.new(557.373352, 76.5544586, 87.77845)},
    {name = "Last corridor", cframe = CFrame.new(-20.5446472, -21.5846024, 3738.65137)},
    {name = "BasePlace", cframe = CFrame.new(63.302063, 2015.68994, 6.87591553)},
}

for _, btn in ipairs(teleports) do
    TeleportSection:NewButton(btn.name, "Teleport", function()
        teleportTo(btn.cframe)
    end)
end

-- Дополнительная вкладка для читов
local otherTab = Window:NewTab("Other cheat")
local cheatSection = otherTab:NewSection("cheat")

cheatSection:NewButton("Infinity yield", "fe admin", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

cheatSection:NewButton("Dex", "fe admin", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UltraFEmotes/im-bored/refs/heads/main/dexnoapi.lua"))()
end)
