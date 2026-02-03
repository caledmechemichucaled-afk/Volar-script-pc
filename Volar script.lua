local function createGui(parent)

--ScreenGui1--

local ScreenGui1 = Instance.new("ScreenGui",parent)

ScreenGui1["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

----ScreenGui1----

--Frame2--

local Frame2 = Instance.new("Frame",ScreenGui1)

Frame2["Visible"] = false

Frame2["Position"] = UDim2.new(0.346609265, 0, 0.380813956, 0)

Frame2["BorderColor3"] = Color3.new(0, 0, 0)

Frame2["Size"] = UDim2.new(0, 284, 0, 204)

Frame2["BorderSizePixel"] = 0

Frame2["BackgroundColor3"] = Color3.new(0, 0, 0)

----Frame2----

--TextLabel3--

local TextLabel3 = Instance.new("TextLabel",Frame2)

TextLabel3["TextWrapped"] = true

TextLabel3["TextColor3"] = Color3.new(1, 1, 1)

TextLabel3["BorderColor3"] = Color3.new(0, 0, 0)

TextLabel3["Text"] = "by: crisstpt"

TextLabel3["TextSize"] = 14

TextLabel3["Font"] = Enum.Font.FredokaOne

TextLabel3["BackgroundTransparency"] = 1

TextLabel3["Position"] = UDim2.new(0.169014081, 0, 0, 0)

TextLabel3["TextScaled"] = true

TextLabel3["Size"] = UDim2.new(0, 188, 0, 46)

TextLabel3["BorderSizePixel"] = 0

TextLabel3["BackgroundColor3"] = Color3.new(1, 1, 1)

----TextLabel3----

--TextButton4--

local TextButton4 = Instance.new("TextButton",Frame2)

TextButton4["TextWrapped"] = true

TextButton4["TextColor3"] = Color3.new(0, 0, 0)

TextButton4["BorderColor3"] = Color3.new(0, 0, 0)

TextButton4["Text"] = "Vuela como loco"

TextButton4["TextSize"] = 14

TextButton4["Font"] = Enum.Font.Bodoni

TextButton4["Name"] = "FlyButton"

TextButton4["Position"] = UDim2.new(0.169014081, 0, 0.411764711, 0)

TextButton4["TextScaled"] = true

TextButton4["Size"] = UDim2.new(0, 74, 0, 36)

TextButton4["BorderSizePixel"] = 0

TextButton4["BackgroundColor3"] = Color3.new(1, 1, 1)

----TextButton4----

--UIStroke5--

local UIStroke5 = Instance.new("UIStroke",Frame2)

UIStroke5["Thickness"] = 7.300000190734863

----UIStroke5----

--TextButton6--

local TextButton6 = Instance.new("TextButton",Frame2)

TextButton6["TextWrapped"] = true

TextButton6["TextColor3"] = Color3.new(0, 0, 0)

TextButton6["BorderColor3"] = Color3.new(0, 0, 0)

TextButton6["Text"] = "DEJAR DE VOLAR}"

TextButton6["TextSize"] = 14

TextButton6["Font"] = Enum.Font.Bodoni

TextButton6["Name"] = "NormalButton"

TextButton6["Position"] = UDim2.new(0.57042253, 0, 0.411764711, 0)

TextButton6["TextScaled"] = true

TextButton6["Size"] = UDim2.new(0, 74, 0, 36)

TextButton6["BorderSizePixel"] = 0

TextButton6["BackgroundColor3"] = Color3.new(1, 1, 1)

----TextButton6----

--Script7--

local Script7 = Instance.new("Script",Frame2)

----Script7----

--TextButton8--

local TextButton8 = Instance.new("TextButton",ScreenGui1)

TextButton8["TextWrapped"] = true

TextButton8["TextColor3"] = Color3.new(1, 1, 1)

TextButton8["BorderColor3"] = Color3.new(0, 0, 0)

TextButton8["Text"] = "crisstpt"

TextButton8["Font"] = Enum.Font.FredokaOne

TextButton8["TextSize"] = 14

TextButton8["Position"] = UDim2.new(-0.00861140992, 0, 0.508720875, 0)

TextButton8["TextScaled"] = true

TextButton8["Size"] = UDim2.new(0, 200, 0, 50)

TextButton8["BorderSizePixel"] = 0

TextButton8["BackgroundColor3"] = Color3.new(0, 0, 0)

----TextButton8----

--Script9--

local Script9 = Instance.new("Script",TextButton8)

----Script9----

--UIStroke10--

local UIStroke10 = Instance.new("UIStroke",TextButton8)

UIStroke10["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

UIStroke10["Thickness"] = 5.199999809265137

----UIStroke10----

--UICorner11--

local UICorner11 = Instance.new("UICorner",TextButton8)

UICorner11["CornerRadius"] = UDim.new(0, 13)

----UICorner11----

spawn(function() --Source for Script7

	local script = Script7

	-- LocalScript dentro del Frame

	local player = game.Players.LocalPlayer

	local uis = game:GetService("UserInputService")

	local runService = game:GetService("RunService")

	

	local character = player.Character or player.CharacterAdded:Wait()

	local humanoid = character:WaitForChild("Humanoid")

	local root = character:WaitForChild("HumanoidRootPart")

	

	-- Botones

	local flyButton = script.Parent:WaitForChild("FlyButton")

	local normalButton = script.Parent:WaitForChild("NormalButton")

	

	-- Variables para volar

	local flying = false

	local flySpeed = 50

	local connection

	

	local function startFlying()

		flying = true

		humanoid.PlatformStand = true  -- desactiva gravedad normal

	

		connection = runService.RenderStepped:Connect(function()

			if flying then

				local moveDirection = Vector3.new(0, 0, 0)

				if uis:IsKeyDown(Enum.KeyCode.W) then moveDirection = moveDirection + workspace.CurrentCamera.CFrame.LookVector end

				if uis:IsKeyDown(Enum.KeyCode.S) then moveDirection = moveDirection - workspace.CurrentCamera.CFrame.LookVector end

				if uis:IsKeyDown(Enum.KeyCode.A) then moveDirection = moveDirection - workspace.CurrentCamera.CFrame.RightVector end

				if uis:IsKeyDown(Enum.KeyCode.D) then moveDirection = moveDirection + workspace.CurrentCamera.CFrame.RightVector end

				if uis:IsKeyDown(Enum.KeyCode.Space) then moveDirection = moveDirection + Vector3.new(0,1,0) end

				if uis:IsKeyDown(Enum.KeyCode.LeftShift) then moveDirection = moveDirection - Vector3.new(0,1,0) end

	

				root.Velocity = moveDirection.Unit * flySpeed

			end

		end)

	end

	

	local function stopFlying()

		flying = false

		humanoid.PlatformStand = false

		if connection then

			connection:Disconnect()

		end

		root.Velocity = Vector3.new(0,0,0)

	end

	

	-- Conectar botones

	flyButton.MouseButton1Click:Connect(startFlying)

	normalButton.MouseButton1Click:Connect(stopFlying)

	

end)

spawn(function() --Source for Script9

	local script = Script9

	-- Referencias

	local button = script.Parent

	local frame = button.Parent:WaitForChild("Frame") -- Ajusta si Frame no está en el mismo parent

	

	-- Estado inicial

	frame.Visible = false

	

	-- Toggle al hacer click

	button.MouseButton1Click:Connect(function()

		frame.Visible = not frame.Visible

	end)

	

	-- FUNCIONALIDAD DE ARRASTRAR

	local dragging = false

	local dragInput

	local dragStart

	local startPos

	

	-- Cuando empieces a arrastrar el frame

	frame.InputBegan:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1 then

			dragging = true

			dragStart = input.Position

			startPos = frame.Position

	

			input.Changed:Connect(function()

				if input.UserInputState == Enum.UserInputState.End then

					dragging = false

				end

			end)

		end

	end)

	

	-- Mientras arrastras el mouse

	frame.InputChanged:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseMovement then

			dragInput = input

		end

	end)

	

	-- Actualiza la posición del frame mientras arrastras

	game:GetService("UserInputService").InputChanged:Connect(function(input)

		if dragging and input == dragInput then

			local delta = input.Position - dragStart

			frame.Position = UDim2.new(

				startPos.X.Scale,

				startPos.X.Offset + delta.X,

				startPos.Y.Scale,

				startPos.Y.Offset + delta.Y

			)

		end

	end)

	

	

end)

end
