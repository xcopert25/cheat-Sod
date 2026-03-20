local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("MyGame Scripts", "RJTheme3")

-- Вкладка и секция
local Tab = Window:NewTab("SOB")
local Section = Tab:NewSection("Sans Omniverse Battle")

-- Автофам
Section:NewLabel("AutoFarm")

Section:NewButton("Autofarm", "Автоматический фейк", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xcopert25/cheat/refs/heads/main/сheat.lua"))()
end)

Section:NewButton("NewAutoFarm", "Новый автофам", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xcopert25/auto-farmdsadsada/refs/heads/main/faawrm.lua"))()
end)

Section:NewButton("Move Coins to Player", "Перемещение монет к игроку", function()
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

-- Чит скорости и прыжка
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
Section:NewLabel("ESP")
Section:NewButton("ESP", "Включить ESP", function()
    -- Создаем папку для ESP только один раз
    local espFolder = workspace:FindFirstChild("ESPFolder")
    if not espFolder then
        espFolder = Instance.new("Folder", workspace)
        espFolder.Name = "ESPFolder"
    end

    -- Запускаем цикл ESP только при первом нажатии
    if not _G.ESPRunning then
        _G.ESPRunning = true

        spawn(function()
            while _G.ESPRunning do
                wait(0.5)
                local existingESP = {}
                -- Собираем текущие рамки
                for _, esp in pairs(espFolder:GetChildren()) do
                    if esp.Name == "EspBox" then
                        existingESP[esp.Adornee] = esp
                    end
                end

                -- Создаем рамки для новых игроков
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

                -- Удаляем устаревшие рамки
                for _, esp in pairs(espFolder:GetChildren()) do
                    if esp.Name == "EspBox" and existingESP[esp.Adornee] then
                        esp:Destroy()
                    end
                end
            end
        end)
    end
end)

-- Вкладка и секция для телепортации
local TeleportTab = Window:NewTab("SOB teleport")
local TeleportSection = TeleportTab:NewSection("Sans Omniverse Battle teleport")

TeleportSection:NewLabel("teleport")

local function teleportTo(position)
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = position
    end
end

local teleportButtons = {
    {name = "Spawn", cframe = CFrame.new(-977.456665, 5.525108337, -52.3848114)},
    {name = "Spawn snowdin", cframe = CFrame.new(-1225.85461, 5.409351945, -55.4106445)},
    {name = "Spawn waterfall", cframe = CFrame.new(-1434.10889, 5.409351945, -55.4106445)},
    {name = "Spawn Hotland", cframe = CFrame.new(-1626.07422, 5.409351945, -55.4106445)},
    {name = "Spawn Beyond God (Have 4.4M)", cframe = CFrame.new(-1850.99866, 5.341791391, -55.4106445)},
    {name = "Snowdin 1", cframe = CFrame.new(-72.0665131, 5.5, -15.2218132)},
    {name = "Snowdin 2", cframe = CFrame.new(823.59613, 74.8315048, -20.296524)},
    {name = "Snowdin 3", cframe = CFrame.new(823.59613, 74.8315048, -20.29652455)},
    {name = "Grilins", cframe = CFrame.new(557.373352, 76.5544586, 87.77845)},
    {name = "Last corridor", cframe = CFrame.new(-20.5446472, -21.5846024, 3738.65137)},
    {name = "BasePlace", cframe = CFrame.new(63.302063, 2015.68994, 6.87591553)},
}

for _, btn in ipairs(teleportButtons) do
    TeleportSection:NewButton(btn.name, "Teleport", function()
        teleportTo(btn.cframe)
    end)
end
