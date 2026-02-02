local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

ScGui = Instance.new("ScreenGui")
MainWindow = Instance.new("Frame")
MainWindowCorner = Instance.new("UICorner")
MainWindowStroke = Instance.new("UIStroke")
MainWindowShadow = Instance.new("ImageLabel")
MainWindowContentPad = Instance.new("Frame")
MainWindowContentPadCorner = Instance.new("UICorner")
CloseWindow = Instance.new("ImageLabel")
CloseWindowPad = Instance.new("ImageButton")
CloseWindowAspectRatio = Instance.new("UIAspectRatioConstraint")
CloseWindowCorner = Instance.new("UICorner")
MinMaxWindow = Instance.new("ImageLabel")
MinMaxWindowPad = Instance.new("ImageButton")
MinMaxWindowAspectRatio = Instance.new("UIAspectRatioConstraint")
MinMaxWindowPadCorner = Instance.new("UICorner")
HideShowWindow = Instance.new("ImageLabel")
HideWindowPad = Instance.new("ImageButton")
HideWindowAspectRatio = Instance.new("UIAspectRatioConstraint")
HideWindowPadCorner = Instance.new("UICorner")
HideWindow = Instance.new("ImageLabel")
HideCorner = Instance.new("Frame")
LineWindowpad = Instance.new("Frame")
Logo = Instance.new("ImageLabel")
AppName = Instance.new("TextLabel")
LogoAspectRatio = Instance.new("UIAspectRatioConstraint")
WinMin = Instance.new("Frame")
WinMinAppName = Instance.new("TextLabel")
WinMinMinButton = Instance.new("ImageLabel")
WinMinMinButtonPad = Instance.new("ImageButton")
WinMinCloseButton = Instance.new("ImageLabel")
WinMinCloseButtonPadCorner = Instance.new("UICorner")
WinMinCloseButtonPad = Instance.new("ImageButton")
WinMinCorner = Instance.new("UICorner")
WinMinStroke = Instance.new("UIStroke")
WinMinLogo = Instance.new("ImageLabel")
WinMinLogoAspectRatio = Instance.new("UIAspectRatioConstraint")
WinMinCloseButtonAspectRatio = Instance.new("UIAspectRatioConstraint")
WinMinMinButtonApectRatio = Instance.new("UIAspectRatioConstraint")
WinMinMinButtonPadAspectRatio = Instance.new("UIAspectRatioConstraint")
WinMinMinButtonPadCorner = Instance.new("UICorner")
TopBar = Instance.new("Frame")
TopBarCorner = Instance.new("UICorner")
BlurEffect = Instance.new("BlurEffect")
FileButton = Instance.new("TextButton")
SettingsButton = Instance.new("TextButton")
ProjectsUIGrid = Instance.new("UIGridLayout")
ProjectsUIPadding = Instance.new("UIPadding")
CreateProjectButton = Instance.new("ImageButton")
CreateProjectButtonUICorner = Instance.new("UICorner")
CreateProjectButtonUILine = Instance.new("UIStroke")
ProjectsList = Instance.new("ScrollingFrame")
ProjectsUIGridAspectRatio = Instance.new("UIAspectRatioConstraint")
CreateProjectButtonText = Instance.new("TextLabel")
CreateProjectButtonImage = Instance.new("ImageLabel")
ModalBackground = Instance.new("Frame")
ModalWindow = Instance.new("Frame")
ModalCorner = Instance.new("UICorner")
ModalStroke = Instance.new("UIStroke")
ModalTopBar = Instance.new("Frame")
ModalTopBarCorner = Instance.new("UICorner")
ModalClose = Instance.new("ImageLabel")
ModalClosePad = Instance.new("ImageButton")
ModalCloseAspectRatio = Instance.new("UIAspectRatioConstraint")
ModalCloseCorner = Instance.new("UICorner")
ModalTitle = Instance.new("TextLabel")
ModalTextField = Instance.new("TextBox")
ModalTextFieldCorner = Instance.new("UICorner")
ModalTextFieldStroke = Instance.new("UIStroke")
ModalTextFieldPadding = Instance.new("UIPadding")
ModalButtons = Instance.new("Frame")
ModalSubmitButton = Instance.new("TextButton")
ModalSubmitCorner = Instance.new("UICorner")
ModalSubmitStroke = Instance.new("UIStroke")
ModalCancelButton = Instance.new("TextButton")
ModalCancelCorner = Instance.new("UICorner")
ModalCancelStroke = Instance.new("UIStroke")

local CurrentWindowSize = nil
local isDragging = false
local dragStart = nil
local startPos = nil
local modalVisible = false
local modalCooldown = false

ScGui.Parent = player:WaitForChild("PlayerGui")
ScGui.IgnoreGuiInset = true
ScGui.ResetOnSpawn = false
ScGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

BlurEffect.Parent = game.Lighting
BlurEffect.Size = 0
BlurEffect.Name = "UIBlurEffect"

MainWindowShadow.Name = "MainWindowShadow"
MainWindowShadow.Size = UDim2.new(1, 20, 1, 20)
MainWindowShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
MainWindowShadow.AnchorPoint = Vector2.new(0.5, 0.5)
MainWindowShadow.BackgroundTransparency = 1
MainWindowShadow.Image = "rbxassetid://5554236805"
MainWindowShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
MainWindowShadow.ImageTransparency = 0.8
MainWindowShadow.ScaleType = Enum.ScaleType.Slice
MainWindowShadow.SliceCenter = Rect.new(23, 23, 277, 277)
MainWindowShadow.ZIndex = 0
MainWindowShadow.Parent = ScGui

MainWindow.Name = "MainWindow"
MainWindow.Size = UDim2.new(1, 0, 1, 0)
MainWindow.AnchorPoint = Vector2.new(0.5, 0.5)
MainWindow.Position = UDim2.new(0.5, 0, 0.5, 0)
MainWindow.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainWindow.BackgroundTransparency = 0.1
MainWindow.Parent = ScGui
MainWindow.BorderSizePixel = 0
MainWindow.ZIndex = 2
MainWindow.ClipsDescendants = true

MainWindowCorner.CornerRadius = UDim.new(0, 12)
MainWindowCorner.Parent = MainWindow

MainWindowStroke.Thickness = 1
MainWindowStroke.Color = Color3.fromRGB(60, 60, 60)
MainWindowStroke.Transparency = 0.5
MainWindowStroke.Parent = MainWindow

TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0.07, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TopBar.BackgroundTransparency = 0.2
TopBar.Parent = MainWindow
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 3

TopBarCorner.CornerRadius = UDim.new(0, 12)
TopBarCorner.Parent = TopBar

WinMin.Name = "WinMin"
WinMin.Size = UDim2.new(0.2, 0, 0.05, 0)
WinMin.AnchorPoint = Vector2.new(0, 1)
WinMin.Position = UDim2.new(-1, 0, 1, 0)
WinMin.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
WinMin.BackgroundTransparency = 0.1
WinMin.Parent = ScGui
WinMin.ZIndex = 10

WinMinCorner.CornerRadius = UDim.new(0, 10)
WinMinCorner.Parent = WinMin

WinMinStroke.Thickness = 1
WinMinStroke.Color = Color3.fromRGB(60, 60, 60)
WinMinStroke.Transparency = 0.5
WinMinStroke.Parent = WinMin

WinMinLogo.Name = "WinMinLogo"
WinMinLogo.Size = UDim2.new(0.7, 0, 0.7, 0)
WinMinLogo.Position = UDim2.new(0.005, 0, 0.5, 0)
WinMinLogo.BackgroundTransparency = 1
WinMinLogo.Image = "rbxassetid://129924778240390"
WinMinLogo.Parent = WinMin
WinMinLogo.AnchorPoint = Vector2.new(0, 0.5)

WinMinLogoAspectRatio.Parent = WinMinLogo
WinMinLogoAspectRatio.AspectRatio = 1

WinMinAppName.Name = "WinMinAppName"
WinMinAppName.Size = UDim2.new(0.58, 0, 1, 0)
WinMinAppName.Position = UDim2.new(0.12, 0, 0.5, 0)
WinMinAppName.AnchorPoint = Vector2.new(0, 0.5)
WinMinAppName.BackgroundTransparency = 1
WinMinAppName.Text = "Script Editor"
WinMinAppName.TextColor3 = Color3.fromRGB(220, 220, 220)
WinMinAppName.Font = Enum.Font.GothamBold
WinMinAppName.TextSize = 14
WinMinAppName.Parent = WinMin
WinMinAppName.TextXAlignment = Enum.TextXAlignment.Left

WinMinCloseButtonPad.Name = "WinMinCloseButtonPad"
WinMinCloseButtonPad.Size = UDim2.new(0.15, 0, 1, 0)
WinMinCloseButtonPad.AnchorPoint = Vector2.new(1, 0)
WinMinCloseButtonPad.Position = UDim2.new(1, 0, 0, 0)
WinMinCloseButtonPad.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
WinMinCloseButtonPad.BackgroundTransparency = 1
WinMinCloseButtonPad.Parent = WinMin
WinMinCloseButtonPad.BorderSizePixel = 0
WinMinCloseButtonPad.AutoButtonColor = false

WinMinCloseButton.Name = "WinMinCloseButton"
WinMinCloseButton.Size = UDim2.new(0.3, 0, 0.3, 0)
WinMinCloseButton.AnchorPoint = Vector2.new(0.5, 0.5)
WinMinCloseButton.Position = UDim2.new(0.5, 0, 0.5, 0)
WinMinCloseButton.BackgroundTransparency = 1
WinMinCloseButton.Parent = WinMinCloseButtonPad
WinMinCloseButton.Image = "rbxassetid://7072725342"
WinMinCloseButton.ImageColor3 = Color3.fromRGB(220, 220, 220)

WinMinCloseButtonPadCorner.CornerRadius = UDim.new(0, 10)
WinMinCloseButtonPadCorner.Parent = WinMinCloseButtonPad

WinMinCloseButtonAspectRatio.Parent = WinMinCloseButton
WinMinCloseButtonAspectRatio.AspectRatio = 1

WinMinMinButtonPad.Name = "WinMinMinButtonPad"
WinMinMinButtonPad.Size = UDim2.new(0.15, 0, 1, 0)
WinMinMinButtonPad.AnchorPoint = Vector2.new(1, 0)
WinMinMinButtonPad.Position = UDim2.new(0.85, 0, 0, 0)
WinMinMinButtonPad.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
WinMinMinButtonPad.BackgroundTransparency = 1
WinMinMinButtonPad.Parent = WinMin
WinMinMinButtonPad.BorderSizePixel = 0
WinMinMinButtonPad.AutoButtonColor = false

WinMinMinButton.Name = "WinMinMinButton"
WinMinMinButton.Size = UDim2.new(0.3, 0, 0.3, 0)
WinMinMinButton.AnchorPoint = Vector2.new(0.5, 0.5)
WinMinMinButton.Position = UDim2.new(0.5, 0, 0.5, 0)
WinMinMinButton.BackgroundTransparency = 1
WinMinMinButton.Parent = WinMinMinButtonPad
WinMinMinButton.Image = "rbxassetid://138230284268115"
WinMinMinButton.ImageColor3 = Color3.fromRGB(220, 220, 220)

WinMinMinButtonPadCorner.CornerRadius = UDim.new(0, 10)
WinMinMinButtonPadCorner.Parent = WinMinMinButtonPad

WinMinMinButtonPadAspectRatio.Parent = WinMinMinButton
WinMinMinButtonPadAspectRatio.AspectRatio = 1

Logo.Name = "Logo"
Logo.Size = UDim2.new(0.7, 0, 0.7, 0)
Logo.Position = UDim2.new(0.015, 0, 0.5, 0)
Logo.AnchorPoint = Vector2.new(0, 0.5)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://129924778240390"
Logo.Parent = TopBar

LogoAspectRatio.Parent = Logo
LogoAspectRatio.AspectRatio = 1

AppName.Name = "AppName"
AppName.Size = UDim2.new(0.2, 0, 1, 0)
AppName.Position = UDim2.new(0.07, 0, 0, 0)
AppName.BackgroundTransparency = 1
AppName.Text = "Script Editor"
AppName.TextColor3 = Color3.fromRGB(240, 240, 240)
AppName.Font = Enum.Font.GothamBold
AppName.TextScaled = true
AppName.Parent = TopBar
AppName.TextXAlignment = Enum.TextXAlignment.Left

CloseWindowPad.Name = "CloseWindowPad"
CloseWindowPad.Size = UDim2.new(0.05, 0, 1, 0)
CloseWindowPad.AnchorPoint = Vector2.new(1, 0)
CloseWindowPad.Position = UDim2.new(1, 0, 0, 0)
CloseWindowPad.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseWindowPad.BackgroundTransparency = 1
CloseWindowPad.Parent = TopBar
CloseWindowPad.BorderSizePixel = 0
CloseWindowPad.AutoButtonColor = false
CloseWindowPad.ZIndex = 4

CloseWindow.Name = "CloseWindow"
CloseWindow.Size = UDim2.new(0.4, 0, 0.4, 0)
CloseWindow.AnchorPoint = Vector2.new(0.5, 0.5)
CloseWindow.Position = UDim2.new(0.5, 0, 0.5, 0)
CloseWindow.BackgroundTransparency = 1
CloseWindow.Parent = CloseWindowPad
CloseWindow.Image = "rbxassetid://7072725342"
CloseWindow.ImageColor3 = Color3.fromRGB(240, 240, 240)

CloseWindowCorner.CornerRadius = UDim.new(0, 8)
CloseWindowCorner.Parent = CloseWindowPad

CloseWindowAspectRatio.Parent = CloseWindow
CloseWindowAspectRatio.AspectRatio = 1

MinMaxWindowPad.Name = "MinMaxWindowPad"
MinMaxWindowPad.Size = UDim2.new(0.05, 0, 1, 0)
MinMaxWindowPad.AnchorPoint = Vector2.new(1, 0)
MinMaxWindowPad.Position = UDim2.new(0.95, 0, 0, 0)
MinMaxWindowPad.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
MinMaxWindowPad.BackgroundTransparency = 1
MinMaxWindowPad.Parent = TopBar
MinMaxWindowPad.BorderSizePixel = 0
MinMaxWindowPad.AutoButtonColor = false
MinMaxWindowPad.ZIndex = 4

MinMaxWindow.Name = "MinMaxWindow"
MinMaxWindow.Size = UDim2.new(0.4, 0, 0.4, 0)
MinMaxWindow.AnchorPoint = Vector2.new(0.5, 0.5)
MinMaxWindow.Position = UDim2.new(0.5, 0, 0.5, 0)
MinMaxWindow.BackgroundTransparency = 1
MinMaxWindow.Parent = MinMaxWindowPad
MinMaxWindow.Image = "rbxassetid://99207301080323"
MinMaxWindow.ImageColor3 = Color3.fromRGB(240, 240, 240)

MinMaxWindowPadCorner.CornerRadius = UDim.new(0, 8)
MinMaxWindowPadCorner.Parent = MinMaxWindowPad

MinMaxWindowAspectRatio.Parent = MinMaxWindow
MinMaxWindowAspectRatio.AspectRatio = 1

HideWindowPad.Name = "HideWindowPad"
HideWindowPad.Size = UDim2.new(0.05, 0, 1, 0)
HideWindowPad.AnchorPoint = Vector2.new(1, 0)
HideWindowPad.Position = UDim2.new(0.9, 0, 0, 0)
HideWindowPad.BackgroundColor3 = Color3.fromRGB(50, 50, 200)
HideWindowPad.BackgroundTransparency = 1
HideWindowPad.Parent = TopBar
HideWindowPad.BorderSizePixel = 0
HideWindowPad.AutoButtonColor = false
HideWindowPad.ZIndex = 4

HideWindow.Name = "HideWindow"
HideWindow.Size = UDim2.new(0.4, 0, 0.4, 0)
HideWindow.AnchorPoint = Vector2.new(0.5, 0.5)
HideWindow.Position = UDim2.new(0.5, 0, 0.5, 0)
HideWindow.BackgroundTransparency = 1
HideWindow.Parent = HideWindowPad
HideWindow.Image = "rbxassetid://138230284268115"
HideWindow.ImageColor3 = Color3.fromRGB(240, 240, 240)

HideWindowPadCorner.CornerRadius = UDim.new(0, 8)
HideWindowPadCorner.Parent = HideWindowPad

HideWindowAspectRatio.Parent = HideWindow
HideWindowAspectRatio.AspectRatio = 1

HideCorner.Name = "HideCorner"
HideCorner.Size = UDim2.new(1, 0, 0.05, 0)
HideCorner.AnchorPoint = Vector2.new(0.5, 0)
HideCorner.Position = UDim2.new(0.5, 0, 0.05, 0)
HideCorner.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
HideCorner.Parent = MainWindow
HideCorner.BorderSizePixel = 0

MainWindowContentPad.Name = "MainWindowContentPad"
MainWindowContentPad.Size = UDim2.new(1, 0, 0.93, 0)
MainWindowContentPad.AnchorPoint = Vector2.new(0.5, 1)
MainWindowContentPad.Position = UDim2.new(0.5, 0, 1, 0)
MainWindowContentPad.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainWindowContentPad.BackgroundTransparency = 0.1
MainWindowContentPad.Parent = MainWindow

MainWindowContentPadCorner.CornerRadius = UDim.new(0, 12)
MainWindowContentPadCorner.Parent = MainWindowContentPad

LineWindowpad.Name = "LineWindowpad"
LineWindowpad.Size = UDim2.new(1, 0, 0.002, 0)
LineWindowpad.AnchorPoint = Vector2.new(0.5, 0)
LineWindowpad.Position = UDim2.new(0.5, 0, 0, 0)
LineWindowpad.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
LineWindowpad.Parent = MainWindowContentPad
LineWindowpad.BorderSizePixel = 0

FileButton.Name = "FileButton"
FileButton.Size = UDim2.new(0.03, 0, 0.03, 0)
FileButton.Position = UDim2.new(0, 0, 0, 0)
FileButton.AnchorPoint = Vector2.new(0, 0)
FileButton.BackgroundTransparency = 1
FileButton.Text = "File"
FileButton.TextColor3 = Color3.fromRGB(220, 220, 220)
FileButton.Font = Enum.Font.SourceSans
FileButton.TextSize = 23
FileButton.Parent = MainWindowContentPad
FileButton.TextXAlignment = Enum.TextXAlignment.Left

SettingsButton.Name = "SettingsButton"
SettingsButton.Size = UDim2.new(0.03, 0, 0.03, 0)
SettingsButton.Position = UDim2.new(0.025, 0, 0, 0)
SettingsButton.AnchorPoint = Vector2.new(0, 0)
SettingsButton.BackgroundTransparency = 1
SettingsButton.Text = "Settings"
SettingsButton.TextColor3 = Color3.fromRGB(220, 220, 220)
SettingsButton.Font = Enum.Font.SourceSans
SettingsButton.TextSize = 23
SettingsButton.Parent = MainWindowContentPad
SettingsButton.TextXAlignment = Enum.TextXAlignment.Left

ProjectsList.Name = "ProjectsList"
ProjectsList.Parent = MainWindow
ProjectsList.Active = true
ProjectsList.BackgroundTransparency = 1
ProjectsList.AnchorPoint = Vector2.new(0.5, 1)
ProjectsList.Position = UDim2.new(0.5, 0, 1, 0)
ProjectsList.Size = UDim2.new(1, 0, 0.9, 0)
ProjectsList.CanvasSize = UDim2.new(0, 0, 0, 0)
ProjectsList.ScrollBarThickness = 0

ProjectsUIPadding.Parent = ProjectsList
ProjectsUIPadding.PaddingBottom = UDim.new(0.01, 0)
ProjectsUIPadding.PaddingLeft = UDim.new(0.01, 0)
ProjectsUIPadding.PaddingRight = UDim.new(0.01, 0)
ProjectsUIPadding.PaddingTop = UDim.new(0.01, 0)

ProjectsUIGrid.Parent = ProjectsList
ProjectsUIGrid.SortOrder = Enum.SortOrder.LayoutOrder
ProjectsUIGrid.CellPadding = UDim2.new(0.5, 0, 0.5, 0)
ProjectsUIGrid.CellSize = UDim2.new(0.2, 0, 0.2, 0)

ProjectsUIGridAspectRatio.Parent = ProjectsUIGrid
ProjectsUIGridAspectRatio.AspectRatio = 1

CreateProjectButton.Name = "CreateProjectButton"
CreateProjectButton.BackgroundTransparency = 1
CreateProjectButton.Parent = ProjectsList

CreateProjectButtonUICorner.CornerRadius = UDim.new(0, 12)
CreateProjectButtonUICorner.Parent = CreateProjectButton

CreateProjectButtonImage.Name = "CreateProjectButtonImage"
CreateProjectButtonImage.Position = UDim2.new(0.5, 0, 0.45, 0)
CreateProjectButtonImage.Size = UDim2.new(0.5, 0, 0.5, 0)
CreateProjectButtonImage.BackgroundTransparency = 1
CreateProjectButtonImage.Image = "rbxassetid://109300103143672"
CreateProjectButtonImage.Parent = CreateProjectButton
CreateProjectButtonImage.AnchorPoint = Vector2.new(0.5, 0.5)

CreateProjectButtonText.Name = "CreateProjectButtonText"
CreateProjectButtonText.Size = UDim2.new(0.1, 0, 0.05, 0)
CreateProjectButtonText.Position = UDim2.new(0.5, 0, 0.92, 0)
CreateProjectButtonText.AnchorPoint = Vector2.new(0.5, 1)
CreateProjectButtonText.BackgroundTransparency = 1
CreateProjectButtonText.Text = "New project"
CreateProjectButtonText.TextColor3 = Color3.fromRGB(220, 220, 220)
CreateProjectButtonText.Font = Enum.Font.SourceSans
CreateProjectButtonText.TextSize = 20
CreateProjectButtonText.Parent = CreateProjectButton

CreateProjectButtonUILine.Parent = CreateProjectButton
CreateProjectButtonUILine.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
CreateProjectButtonUILine.Color = Color3.fromRGB(0, 170, 255)
CreateProjectButtonUILine.Thickness = 1.5

ModalBackground.Name = "ModalBackground"
ModalBackground.Size = UDim2.new(1, 0, 1, 0)
ModalBackground.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ModalBackground.BackgroundTransparency = 1
ModalBackground.ZIndex = 50
ModalBackground.Parent = ScGui
ModalBackground.Visible = false

ModalWindow.Name = "ModalWindow"
ModalWindow.Size = UDim2.new(0.35, 0, 0.4, 0)
ModalWindow.AnchorPoint = Vector2.new(0.5, 0.5)
ModalWindow.Position = UDim2.new(0.5, 0, 0.5, 0)
ModalWindow.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ModalWindow.ZIndex = 51
ModalWindow.Parent = ScGui
ModalWindow.Visible = false

ModalCorner.CornerRadius = UDim.new(0, 12)
ModalCorner.Parent = ModalWindow

ModalStroke.Thickness = 1
ModalStroke.Color = Color3.fromRGB(60, 60, 60)
ModalStroke.Parent = ModalWindow

ModalTopBar.Name = "ModalTopBar"
ModalTopBar.Size = UDim2.new(1, 0, 0.12, 0)
ModalTopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ModalTopBar.Parent = ModalWindow

ModalTopBarCorner.CornerRadius = UDim.new(0, 12)
ModalTopBarCorner.Parent = ModalTopBar

ModalClosePad.Name = "ModalClosePad"
ModalClosePad.Size = UDim2.new(0.08, 0, 0.8, 0)
ModalClosePad.AnchorPoint = Vector2.new(1, 0.5)
ModalClosePad.Position = UDim2.new(0.98, 0, 0.5, 0)
ModalClosePad.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ModalClosePad.BackgroundTransparency = 0.8
ModalClosePad.Parent = ModalTopBar
ModalClosePad.AutoButtonColor = false

ModalClose.Name = "ModalClose"
ModalClose.Size = UDim2.new(0.6, 0, 0.6, 0)
ModalClose.AnchorPoint = Vector2.new(0.5, 0.5)
ModalClose.Position = UDim2.new(0.5, 0, 0.5, 0)
ModalClose.BackgroundTransparency = 1
ModalClose.Image = "rbxassetid://7072725342"
ModalClose.ImageColor3 = Color3.fromRGB(240, 240, 240)
ModalClose.Parent = ModalClosePad

ModalCloseCorner.CornerRadius = UDim.new(0, 6)
ModalCloseCorner.Parent = ModalClosePad

ModalCloseAspectRatio.Parent = ModalClose
ModalCloseAspectRatio.AspectRatio = 1

ModalTitle.Name = "ModalTitle"
ModalTitle.Size = UDim2.new(0.8, 0, 1, 0)
ModalTitle.Position = UDim2.new(0.02, 0, 0, 0)
ModalTitle.BackgroundTransparency = 1
ModalTitle.Text = "New Project"
ModalTitle.TextColor3 = Color3.fromRGB(240, 240, 240)
ModalTitle.Font = Enum.Font.GothamBold
ModalTitle.TextSize = 18
ModalTitle.TextXAlignment = Enum.TextXAlignment.Left
ModalTitle.Parent = ModalTopBar

ModalTextField.Name = "ModalTextField"
ModalTextField.Size = UDim2.new(0.9, 0, 0.15, 0)
ModalTextField.AnchorPoint = Vector2.new(0.5, 0)
ModalTextField.Position = UDim2.new(0.5, 0, 0.22, 0)
ModalTextField.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ModalTextField.Text = ""
ModalTextField.PlaceholderText = "Enter project name..."
ModalTextField.TextColor3 = Color3.fromRGB(240, 240, 240)
ModalTextField.Font = Enum.Font.Gotham
ModalTextField.TextSize = 16
ModalTextField.Parent = ModalWindow

ModalTextFieldCorner.CornerRadius = UDim.new(0, 8)
ModalTextFieldCorner.Parent = ModalTextField

ModalTextFieldStroke.Thickness = 1
ModalTextFieldStroke.Color = Color3.fromRGB(0, 170, 255)
ModalTextFieldStroke.Parent = ModalTextField

ModalTextFieldPadding.Parent = ModalTextField
ModalTextFieldPadding.PaddingLeft = UDim.new(0.05, 0)

ModalButtons.Name = "ModalButtons"
ModalButtons.Size = UDim2.new(0.9, 0, 0.15, 0)
ModalButtons.AnchorPoint = Vector2.new(0.5, 1)
ModalButtons.Position = UDim2.new(0.5, 0, 0.95, 0)
ModalButtons.BackgroundTransparency = 1
ModalButtons.Parent = ModalWindow

ModalSubmitButton.Name = "ModalSubmitButton"
ModalSubmitButton.Size = UDim2.new(0.45, 0, 1, 0)
ModalSubmitButton.AnchorPoint = Vector2.new(0, 0.5)
ModalSubmitButton.Position = UDim2.new(0, 0, 0.5, 0)
ModalSubmitButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
ModalSubmitButton.Text = "Submit"
ModalSubmitButton.TextColor3 = Color3.fromRGB(240, 240, 240)
ModalSubmitButton.Font = Enum.Font.GothamBold
ModalSubmitButton.TextSize = 16
ModalSubmitButton.Parent = ModalButtons

ModalSubmitCorner.CornerRadius = UDim.new(0, 8)
ModalSubmitCorner.Parent = ModalSubmitButton

ModalSubmitStroke.Thickness = 1
ModalSubmitStroke.Color = Color3.fromRGB(100, 180, 255)
ModalSubmitStroke.Parent = ModalSubmitButton

ModalCancelButton.Name = "ModalCancelButton"
ModalCancelButton.Size = UDim2.new(0.45, 0, 1, 0)
ModalCancelButton.AnchorPoint = Vector2.new(1, 0.5)
ModalCancelButton.Position = UDim2.new(1, 0, 0.5, 0)
ModalCancelButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ModalCancelButton.Text = "Cancel"
ModalCancelButton.TextColor3 = Color3.fromRGB(240, 240, 240)
ModalCancelButton.Font = Enum.Font.GothamBold
ModalCancelButton.TextSize = 16
ModalCancelButton.Parent = ModalButtons

ModalCancelCorner.CornerRadius = UDim.new(0, 8)
ModalCancelCorner.Parent = ModalCancelButton

ModalCancelStroke.Thickness = 1
ModalCancelStroke.Color = Color3.fromRGB(100, 100, 100)
ModalCancelStroke.Parent = ModalCancelButton

local function animateButton(button, transparency, duration)
	TweenService:Create(button, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = transparency}):Play()
end

CloseWindowPad.MouseEnter:Connect(function()
	animateButton(CloseWindowPad, 0.2, 0.15)
end)

CloseWindowPad.MouseLeave:Connect(function()
	animateButton(CloseWindowPad, 1, 0.15)
end)

MinMaxWindowPad.MouseEnter:Connect(function()
	animateButton(MinMaxWindowPad, 0.2, 0.15)
end)

MinMaxWindowPad.MouseLeave:Connect(function()
	animateButton(MinMaxWindowPad, 1, 0.15)
end)

HideWindowPad.MouseEnter:Connect(function()
	animateButton(HideWindowPad, 0.2, 0.15)
end)

HideWindowPad.MouseLeave:Connect(function()
	animateButton(HideWindowPad, 1, 0.15)
end)

WinMinMinButtonPad.MouseEnter:Connect(function()
	animateButton(WinMinMinButtonPad, 0.2, 0.15)
end)

WinMinMinButtonPad.MouseLeave:Connect(function()
	animateButton(WinMinMinButtonPad, 1, 0.15)
end)

WinMinCloseButtonPad.MouseEnter:Connect(function()
	animateButton(WinMinCloseButtonPad, 0.2, 0.15)
end)

WinMinCloseButtonPad.MouseLeave:Connect(function()
	animateButton(WinMinCloseButtonPad, 1, 0.15)
end)

ModalClosePad.MouseEnter:Connect(function()
	animateButton(ModalClosePad, 0.4, 0.15)
end)

ModalClosePad.MouseLeave:Connect(function()
	animateButton(ModalClosePad, 0.8, 0.15)
end)

ModalSubmitButton.MouseEnter:Connect(function()
	TweenService:Create(ModalSubmitButton, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(0, 140, 240)}):Play()
end)

ModalSubmitButton.MouseLeave:Connect(function()
	TweenService:Create(ModalSubmitButton, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(0, 120, 215)}):Play()
end)

ModalCancelButton.MouseEnter:Connect(function()
	TweenService:Create(ModalCancelButton, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}):Play()
end)

ModalCancelButton.MouseLeave:Connect(function()
	TweenService:Create(ModalCancelButton, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
end)

MinMaxWindowPad.MouseButton1Click:Connect(function()
	if MinMaxWindow.Image == "rbxassetid://99207301080323" then
		TweenService:Create(MainWindow, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(0.8, 0, 0.8, 0)}):Play()
		TweenService:Create(MainWindow, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.05}):Play()
		MinMaxWindow.Image = "rbxassetid://138875518325015"
	else
		TweenService:Create(MainWindow, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = UDim2.new(1, 0, 1, 0)}):Play()
		TweenService:Create(MainWindow, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.1}):Play()
		TweenService:Create(MainWindow, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
		MinMaxWindow.Image = "rbxassetid://99207301080323"
	end
end)

HideWindowPad.MouseButton1Click:Connect(function()
	CurrentWindowSize = MainWindow.Size
	TweenService:Create(MainWindow, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
	TweenService:Create(BlurEffect, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = 0}):Play()
	TweenService:Create(WinMin, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(0.02, 0, 0.98, 0)}):Play()
	MainWindowContentPad.Visible = false
end)

WinMinMinButtonPad.MouseButton1Click:Connect(function()
	TweenService:Create(MainWindow, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = CurrentWindowSize}):Play()
	TweenService:Create(BlurEffect, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = 10}):Play()
	TweenService:Create(WinMin, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(-1, 0, 1, 0)}):Play()
	MainWindowContentPad.Visible = true
end)

CloseWindowPad.MouseButton1Click:Connect(function()
	TweenService:Create(MainWindow, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
	TweenService:Create(MainWindow, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 1}):Play()
	TweenService:Create(BlurEffect, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = 0}):Play()
	wait(0.2)
	ScGui:Destroy()
	BlurEffect:Destroy()
end)

WinMinCloseButtonPad.MouseButton1Click:Connect(function()
	TweenService:Create(WinMin, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Position = UDim2.new(-1, 0, 1, 0)}):Play()
	wait(0.2)
	ScGui:Destroy()
	BlurEffect:Destroy()
end)

local function showModal()
	if modalCooldown then return end
	modalCooldown = true
	
	modalVisible = true
	ModalBackground.Visible = true
	ModalWindow.Visible = true
	ModalTextField.Text = ""
	
	TweenService:Create(ModalBackground, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.5}):Play()
	TweenService:Create(ModalWindow, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0.35, 0, 0.4, 0)}):Play()
	
	wait(0.2)
	modalCooldown = false
end

local function hideModal()
	if modalCooldown then return end
	modalCooldown = true
	
	modalVisible = false
	TweenService:Create(ModalBackground, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 1}):Play()
	TweenService:Create(ModalWindow, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
	
	wait(0.2)
	ModalBackground.Visible = false
	ModalWindow.Visible = false
	modalCooldown = false
end

local function flashModal()
	if not modalVisible then return end
	
	local originalColor = ModalStroke.Color
	local flashTween = TweenService:Create(ModalStroke, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(255, 50, 50)})
	local revertTween = TweenService:Create(ModalStroke, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Color = originalColor})
	
	flashTween:Play()
	wait(0.1)
	revertTween:Play()
end

CreateProjectButton.MouseButton1Click:Connect(function()
	showModal()
end)

ModalClosePad.MouseButton1Click:Connect(function()
	hideModal()
end)

ModalCancelButton.MouseButton1Click:Connect(function()
	hideModal()
end)

ModalSubmitButton.MouseButton1Click:Connect(function()
	local projectName = ModalTextField.Text
	if projectName and #projectName > 0 then
		print("Creating new project:", projectName)
		hideModal()
	else
		flashModal()
	end
end)

ModalBackground.MouseButton1Click:Connect(function()
	flashModal()
end)

UserInputService.InputBegan:Connect(function(input)
	if modalVisible and input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.Return then
			local projectName = ModalTextField.Text
			if projectName and #projectName > 0 then
				print("Creating new project:", projectName)
				hideModal()
			else
				flashModal()
			end
		elseif input.KeyCode == Enum.KeyCode.Escape then
			hideModal()
		end
	end
end)

TweenService:Create(BlurEffect, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = 10}):Play()

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	MainWindow.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainWindow.InputBegan:Connect(function(input)
	if MinMaxWindow.Image == "rbxassetid://138875518325015" then
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = MainWindow.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end
end)

MainWindow.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
