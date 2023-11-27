local UserInputService = game:GetService("UserInputService")

-- Ana Frame oluşturun
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
mainFrame.Parent = game.Players.LocalPlayer.PlayerGui

-- Küçültme ve büyütme için Frame'ler
local minimizeFrame = Instance.new("Frame")
minimizeFrame.Size = UDim2.new(0, 30, 0, 30)
minimizeFrame.Position = UDim2.new(1, -40, 0, 0)
minimizeFrame.BackgroundColor3 = Color3.new(0, 0, 0)
minimizeFrame.Parent = mainFrame

local maximizeFrame = Instance.new("Frame")
maximizeFrame.Size = UDim2.new(0, 30, 0, 30)
maximizeFrame.Position = UDim2.new(1, -40, 0, 40)
maximizeFrame.BackgroundColor3 = Color3.new(0, 0, 0)
maximizeFrame.Parent = mainFrame

-- Kapatma için Frame
local closeFrame = Instance.new("Frame")
closeFrame.Size = UDim2.new(0, 30, 0, 30)
closeFrame.Position = UDim2.new(1, -40, 0, 80)
closeFrame.BackgroundColor3 = Color3.new(0, 0, 0)
closeFrame.Parent = mainFrame

-- Sayfa Frame'leri oluşturun
local page1 = Instance.new("Frame")
page1.Size = UDim2.new(1, 0, 1, 0)
page1.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
page1.Visible = true
page1.Parent = mainFrame

local page2 = Instance.new("Frame")
page2.Size = UDim2.new(1, 0, 1, 0)
page2.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
page2.Visible = false
page2.Parent = mainFrame

-- Sayfa geçiş butonları oluşturun
local buttonPage1 = Instance.new("TextButton")
buttonPage1.Size = UDim2.new(0, 100, 0, 50)
buttonPage1.Position = UDim2.new(0, 10, 0, 10)
buttonPage1.BackgroundColor3 = Color3.new(0, 0, 1)
buttonPage1.Text = "Sayfa 1"
buttonPage1.TextColor3 = Color3.new(1, 1, 1)
buttonPage1.Parent = mainFrame

local buttonPage2 = Instance.new("TextButton")
buttonPage2.Size = UDim2.new(0, 100, 0, 50)
buttonPage2.Position = UDim2.new(0, 10, 0, 70)
buttonPage2.BackgroundColor3 = Color3.new(0, 0, 1)
buttonPage2.Text = "Sayfa 2"
buttonPage2.TextColor3 = Color3.new(1, 1, 1)
buttonPage2.Parent = mainFrame

-- Toggle oluşturun
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 30)
toggleButton.Position = UDim2.new(1, -110, 1, -40)
toggleButton.BackgroundColor3 = Color3.new(0, 0, 1)
toggleButton.Text = "Toggle"
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Parent = mainFrame

-- Toggle durumu
local toggleState = false

toggleButton.MouseButton1Click:Connect(function()
    toggleState = not toggleState
    toggleButton.BackgroundColor3 = toggleState and Color3.new(0, 1, 0) or Color3.new(0, 0, 1)
end)

-- Ana Frame'i küçültme/büyütme
local isMinimized = false

minimizeFrame.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    mainFrame.Size = isMinimized and UDim2.new(0, 30, 0, 30) or UDim2.new(0, 400, 0, 300)
end)

-- Ana Frame'i kapatma
closeFrame.MouseButton1Click:Connect(function()
    mainFrame:Destroy()
end)

-- Ana Frame'i sürükleme
local isDragging = false
local offset = Vector2.new()

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        offset = input.Position - mainFrame.Position.XY
    end
end)

mainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        mainFrame.Position = UDim2.new(0, input.Position.X - offset.X, 0, input.Position.Y - offset.Y)
    end
end)
