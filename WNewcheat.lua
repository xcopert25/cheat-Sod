-- Загружаем UI-библиотеку
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("MyGame Scripts", "RJTheme3")

-- Создаем вкладки и секции
local sobTab = Window:NewTab("SOB")
local sobSection = sobTab:NewSection("Sans Omniverse Battle")
local teleportTab = Window:NewTab("SOB teleport")
local teleportSection = teleportTab:NewSection("Teleport to locations")
local otherTab = Window:NewTab("Other cheat")
local cheatSection = otherTab:NewSection("Cheats")

-- Объявляем функции для телепортации и перемещения монет
local function teleportPlayer(position)
    local player = game.Players.LocalPlayer
    if not player then return end
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = CFrame.new(position)
    end
end

local function moveCoinsToPlayer()
    local player = game.Players.LocalPlayer
    if not player then return end
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local coinsFolder = workspace:FindFirstChild("Coins")
    if coinsFolder then
        for _, coin in pairs(coinsFolder:GetChildren()) do
            if coin:IsA("BasePart") then
                coin.CFrame = hrp.CFrame
            end
        end
    end
end

-- Автофам
sobSection:NewLabel("AutoFarm")
sobSection:NewButton("Autofarm", "Автоматический фейк", function()
    for i = 1, 10000 do
        teleportPlayer(Vector3.new(-18.8776093, -48.4361572, 3668.14722))
        moveCoinsToPlayer()
        wait(3)
        teleportPlayer(Vector3.new(831.804932, 74.5408936, 176.584122))
        moveCoinsToPlayer()
        wait(3)
        teleportPlayer(Vector3.new(63.2598038, 2028.52783, 6.85559082))
    end
end)

sobSection:NewButton("NewAutoFarm", "Новый автофам", function()
    for i = 1, 10000 do
        teleportPlayer(Vector3.new(-18.8776093, -53.4361572, 3668.14722))
        moveCoinsToPlayer()
        wait(3)
        teleportPlayer(Vector3.new(831.804932, 69.5408936, 176.584122))
        moveCoinsToPlayer()
        wait(3)
        teleportPlayer(Vector3.new(63.2598038, 2023.52783, 6.85559082))
    end
end)

-- Перемещение монет к игроку (с возможностью включения/выключения)
local movingCoins = false
local moveCoinsConnection

sobSection:NewButton("Start Moving Coins", "Начать перемещать монеты", function()
    if movingCoins then return end
    movingCoins = true
    moveCoinsConnection = game:GetService("RunService").RenderStepped:Connect(function()
        local player = game.Players.LocalPlayer
        if not player then return end
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local coinsFolder = workspace:FindFirstChild("Coins")
        if coinsFolder then
            for _, coin in pairs(coinsFolder:GetChildren()) do
                if coin:IsA("BasePart") then
                    coin.CFrame = hrp.CFrame
                end
            end
        end
    end)
end)

sobSection:NewButton("Stop Moving Coins", "Остановить перемещение монет", function()
    if not movingCoins then return end
    movingCoins = false
    if moveCoinsConnection then
        moveCoinsConnection:Disconnect()
        moveCoinsConnection = nil
    end
end)

-- Слайдеры для скорости и прыжка
sobSection:NewLabel("Speed and Jump")
sobSection:NewSlider("Speed", "Speed 0-500", 500, 0, function(s)
    local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = s
    end
end)

sobSection:NewSlider("Jump Power", "Jump 0-250", 250, 0, function(s)
    local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = s
    end
end)

-- =========================
-- ТЕЛЕПОРТЫ
-- =========================

local function teleport(pos)
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = pos
    end
end

local teleports = {
    {name = "Spawn", cframe = CFrame.new(-977.4567, 5.5251, -52.3848)},
    {name = "Spawn snowdin", cframe = CFrame.new(-1225.8546, 5.4093, -55.4106)},
    {name = "Spawn waterfall", cframe = CFrame.new(-1434.1088, 5.4093, -55.4106)},
    {name = "Spawn Hotland", cframe = CFrame.new(-1626.0742, 5.4093, -55.4106)},
    {name = "Beyond God (4.4M)", cframe = CFrame.new(-1850.9987, 5.3418, -55.4106)},
    {name = "Snowdin 1", cframe = CFrame.new(-72.0665, 5.5, -15.2218)},
    {name = "Snowdin 2", cframe = CFrame.new(831.804932, 69.5408936, 176.584122)},
    {name = "Snowdin 3", cframe = CFrame.new(823.5961, 74.8315, -20.2965)},
    {name = "Goblins", cframe = CFrame.new(557.3734, 76.5545, 87.7784)},
    {name = "Last corridor", cframe = CFrame.new(-20.5446, -21.5846, 3738.651)},
    {name = "BasePlace", cframe = CFrame.new(63.3021, 2015.6899, 6.8759)},
}

for _, tp in pairs(teleports) do
    teleportSection:NewButton(tp.name, "Teleport", function()
        teleport(tp.cframe)
    end)
end

-- =========================
-- Другие читы
-- =========================

cheatSection:NewButton("Infinity Yield", "Admin", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

cheatSection:NewButton("Dex", "Admin", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UltraFEmotes/im-bored/refs/heads/main/dexnoapi.lua"))()
end)

cheatSection:NewButton("Anti AFK", "Anti AFK", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/scripts/main/AntiAfk2.lua"))()
end)
