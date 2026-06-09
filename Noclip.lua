local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local HideButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Настройка GUI
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "NoclipMobileFix"

-- Главное окно (его можно двигать)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Position = UDim2.new(0.5, -75, 0.2, 0)
MainFrame.Size = UDim2.new(0, 150, 0, 110)
MainFrame.Active = true
MainFrame.Draggable = true -- Двигай пальцем за это окно

-- Заголовок
Title.Parent = MainFrame
Title.Size = UDim2.new(0.6, 0, 0, 30)
Title.Text = "NOCLIP"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Position = UDim2.new(0.05, 0, 0, 0)

-- Кнопка Свернуть [-] (прячет кнопку ON/OFF)
HideButton.Parent = MainFrame
HideButton.Position = UDim2.new(0.6, 0, 0, 5)
HideButton.Size = UDim2.new(0, 20, 0, 20)
HideButton.Text = "-"
HideButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
HideButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Кнопка Закрыть [X] (удаляет чит)
CloseButton.Parent = MainFrame
CloseButton.Position = UDim2.new(0.8, 0, 0, 5)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Text = "X"
CloseButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Кнопка ВКЛ/ВЫКЛ (самая большая)
ToggleButton.Parent = MainFrame
ToggleButton.Position = UDim2.new(0.1, 0, 0.4, 0)
ToggleButton.Size = UDim2.new(0.8, 0, 0.45, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ToggleButton.Text = "OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 20
Instance.new("UICorner", ToggleButton)

-- Логика
local noclip = false
local runService = game:GetService("RunService")
local player = game.Players.LocalPlayer

-- Работа Noclip
runService.Stepped:Connect(function()
    if noclip then
        if player.Character then
            for _, v in pairs(player.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end
end)

-- Нажатие на ВКЛ/ВЫКЛ
ToggleButton.MouseButton1Click:Connect(function()
    noclip = not noclip
    ToggleButton.Text = noclip and "ON" or "OFF"
    ToggleButton.BackgroundColor3 = noclip and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(200, 50, 50)
end)

-- Нажатие на Свернуть
HideButton.MouseButton1Click:Connect(function()
    if ToggleButton.Visible then
        ToggleButton.Visible = false
        MainFrame.Size = UDim2.new(0, 150, 0, 30) -- Уменьшаем окно
        HideButton.Text = "+"
    else
        ToggleButton.Visible = true
        MainFrame.Size = UDim2.new(0, 150, 0, 110) -- Возвращаем размер
        HideButton.Text = "-"
    end
end)

-- Нажатие на Закрыть
CloseButton.MouseButton1Click:Connect(function()
    noclip = false
    ScreenGui:Destroy()
end)
