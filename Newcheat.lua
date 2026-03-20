local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("MyGame Scripts", "RJTheme3")

-- Основная вкладка
local Tab = Window:NewTab("SOB")
local Section = Tab:NewSection("Sans Omniverse Battle")

-- AutoFarm
Section:NewButton("Autofarm", "AutofarmFCrame", function()
    local function teleportPlayer(position, waitTime)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        humanoidRootPart.CFrame = CFrame.new(position)
        wait(waitTime)
    end

    local function moveCoinsToPlayer()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local coinsFolder = workspace:FindFirstChild("Coins")
        if coinsFolder then
            for _, coin in pairs(coinsFolder:GetChildren()) do
                if coin:IsA("BasePart") then
                    coin.CFrame = humanoidRootPart.CFrame
                end
            end
        end
    end

    for i = 1, 10000 do
        teleportPlayer(Vector3.new(-10.6451969, -44.908596, 3508.67578), 1)
        moveCoinsToPlayer()
        wait(3)

        teleportPlayer(Vector3.new(459.20813, 78.4193726, 111.413284), 1)
        moveCoinsToPlayer()
        wait(3)

        teleportPlayer(Vector3.new(63.2598038, 2023.52783, 6.85559082), 1)
    end
end)

-- Вторая кнопка
Section:NewButton("NewAutoFarm", "Newfarm", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xcopert25/auto-farmdsadsada/refs/heads/main/faawrm.lua"))()
end)

-- Перемещение монет
Section:NewButton("Move Coins to Player", "Автоматическое перемещение монет", function()
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

-- Слайдеры для скорости и прыжка
Section:NewLabel("speed and jump cheat")
Section:NewSlider("Speedcheat", "speed 0-500", 500, 0, function(s)
    local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = s
    end
end)

Section:NewSlider("Jumpcheat", "Jump Power 0-250", 250, 0, function(s)
    local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = s
    end
end)

-- ESP
Section:NewButton("esp", "esp", function()
    -- Создаем ESP для всех объектов с Humanoid
    coroutine.wrap(function()
        while true do
            for _, child in ipairs(workspace:GetDescendants()) do
                if child:FindFirstChild("Humanoid") then
                    if not child:FindFirstChild("EspBox") then
                        local hrp = child:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local esp = Instance.new("BoxHandleAdornment")
                            esp.Name = "EspBox"
                            esp.Adornee = hrp
                            esp.Size = Vector3.new(4, 5, 1)
                            esp.Transparency = 0.65
                            esp.Color3 = Color3.fromRGB(255, 48, 48)
                            esp.AlwaysOnTop = true
                            esp.Parent = game.CoreGui
                        end
                    end
                end
            end
            wait(0.5)
        end
    end)()
end)

-- Телепорты
local teleportTab = Window:NewTab("SOB teleport")
local teleportSection = teleportTab:NewSection("Sans Omniverse Battle teleport")

local function teleportToPosition(pos)
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(pos)
    end
end

local teleports = {
    {name = "Spawn", pos = Vector3.new(-977.4567, 5.5251, -52.3848)},
    {name = "Spawn snowdin", pos = Vector3.new(-1225.8546, 5.4093, -55.4106)},
    {name = "Spawn waterfall", pos = Vector3.new(-1434.1088, 5.4093, -55.4106)},
    {name = "Spawn Hotland", pos = Vector3.new(-1626.0742, 5.4093, -55.4106)},
    {name = "Beyond God (4.4M)", pos = Vector3.new(-1850.9987, 5.3418, -55.4106)},
    {name = "Snowdin 1", pos = Vector3.new(-72.0665, 5.5, -15.2218)},
    {name = "Snowdin 2", pos = Vector3.new(823.5961, 74.8315, -20.2965)},
    {name = "Snowdin 3", pos = Vector3.new(823.5961, 74.8315, -20.2965)},
    {name = "Grilins", pos = Vector3.new(557.3734, 76.5545, 87.7784)},
    {name = "Last corridor", pos = Vector3.new(-20.5446, -21.5846, 3738.651)},
    {name = "BasePlace", pos = Vector3.new(63.3021, 2015.6899, 6.8759)},
}

for _, tp in pairs(teleports) do
    teleportSection:NewButton(tp.name, "Teleport", function()
        teleportToPosition(tp.pos)
    end)
end

-- Другие читы
local otherTab = Window:NewTab("Other cheat")
local cheatSection = otherTab:NewSection("Cheats")

cheatSection:NewButton("Infinity yield", "Admin", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

cheatSection:NewButton("Dex", "Admin", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UltraFEmotes/im-bored/refs/heads/main/dexnoapi.lua"))()
end)

cheatSection:NewButton("Anti AFK", "Anti AFK", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/scripts/main/AntiAfk2.lua"))()
end)
