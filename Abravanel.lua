--// Serviços
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local TextChatService = game:GetService("TextChatService")

local player = Players.LocalPlayer

--// Controle de envio
local delayEnvio = 0.05
local podeEnviar = true

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "AbravanelHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.new(0, 0, 0, 0)
main.Position = UDim2.new(0.5, -90, 0.5, -100)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
main.Active = true
main.Draggable = true

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

--// Título
local title = Instance.new("TextLabel")
title.Parent = main
title.Size = UDim2.new(1, -30, 0, 30)
title.BackgroundTransparency = 1
title.Text = "✌ Abravanel Hub 🇨🇴"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 14

--// Botão minimizar
local minimizar = Instance.new("TextButton")
minimizar.Parent = main
minimizar.Size = UDim2.new(0, 30, 0, 30)
minimizar.Position = UDim2.new(1, -30, 0, 0)
minimizar.Text = "-"
minimizar.BackgroundTransparency = 1
minimizar.TextColor3 = Color3.new(1, 1, 1)
minimizar.Font = Enum.Font.GothamBold
minimizar.TextSize = 18

--// Container
local container = Instance.new("Frame")
container.Parent = main
container.Position = UDim2.new(0, 0, 0, 35)
container.Size = UDim2.new(1, 0, 1, -35)
container.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout")
layout.Parent = container
layout.Padding = UDim.new(0, 6)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

--// Função enviar chat
local function enviar(msg)
	if not podeEnviar then
		return
	end

	podeEnviar = false

	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		local canal = TextChatService.TextChannels:FindFirstChild("RBXGeneral")

		if canal then
			canal:SendAsync(msg)
		end
	end

	task.delay(delayEnvio, function()
		podeEnviar = true
	end)
end

--// Criar botão
local function criarBotao(texto)
	local btn = Instance.new("TextButton")
	btn.Parent = container
	btn.Size = UDim2.new(0.9, 0, 0, 28)
	btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Text = texto
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 12
	btn.AutoButtonColor = false

	local corner = Instance.new("UICorner")
	corner.Parent = btn
	corner.CornerRadius = UDim.new(0, 8)

	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2), {
			BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		}):Play()
	end)

	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.2), {
			BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		}):Play()
	end)

	btn.MouseButton1Click:Connect(function()
		enviar(texto)
	end)
end

--// Comandos
criarBotao("//Mat・Scar | Abravanel [🇨🇴🇧🇷]")
criarBotao("//render | Abravanel tá? [🇧🇷🇨🇴]")
criarBotao("//furar pneu | Toma essa aí 🔪")
criarBotao("//lockpick | perdeu o carro, but🔑")
criarBotao("//Coronhada de Scar 🇨🇴")
criarBotao("//render | Anti-QDM na Casa [🇨🇴🇧🇷]")
criarBotao("//Tapa")
criarBotao("//Desmaiar | ala, dormiu 🤣")
criarBotao("//Algemar | Abravanel como sempre [🇨🇴]")

--// Animação de abrir
TweenService:Create(
	main,
	TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
	{
		Size = UDim2.new(0, 180, 0, 300)
	}
):Play()

--// Minimizar
local minimizado = false

minimizar.MouseButton1Click:Connect(function()
	if not minimizado then
		TweenService:Create(main, TweenInfo.new(0.3), {
			Size = UDim2.new(0, 180, 0, 30)
		}):Play()

		container.Visible = false
		minimizado = true
	else
		container.Visible = true

		TweenService:Create(main, TweenInfo.new(0.3), {
			Size = UDim2.new(0, 180, 0, 300)
		}):Play()

		minimizado = false
	end
end)
