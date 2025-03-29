local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/TALENTLESS/main/notif_lib.lua"))()

local function playSound(soundId, loudness)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. soundId
    sound.Parent = game.Players.LocalPlayer.Character or game.Players.LocalPlayer
    sound.Volume = loudness or 1  -- Default to full volume if no loudness is provided
    sound:Play()
end

-- StarterGui.ScreenGui
screengui = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
screengui["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

local frame = Instance.new("Frame", screengui);
frame["BorderSizePixel"] = 0;
frame["BackgroundColor3"] = Color3.fromRGB(47, 47, 47);
frame["Size"] = UDim2.new(0, 254, 0, 326);
frame["Position"] = UDim2.new(0.40062, 0, 0.28553, 0);
frame["BorderColor3"] = Color3.fromRGB(0, 0, 0);

local listLayout = Instance.new("UIListLayout", frame)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 15)
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local padding = Instance.new("UIPadding", frame)
padding.PaddingTop = UDim.new(0, 10)

-- StarterGui.ScreenGui.Frame.TextLabel
local newsongLabel = Instance.new("TextLabel", frame);
newsongLabel["TextWrapped"] = true;
newsongLabel["BorderSizePixel"] = 3;
newsongLabel["TextSize"] = 50;
newsongLabel["BackgroundColor3"] = Color3.fromRGB(208, 49, 44);
newsongLabel["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
newsongLabel["TextColor3"] = Color3.fromRGB(255, 255, 255);
newsongLabel["Size"] = UDim2.new(0, 218, 0, 50);
newsongLabel["BorderColor3"] = Color3.fromRGB(255, 255, 255);
newsongLabel["Text"] = [[stuff]];

local midi2lualabel = Instance.new("TextLabel", frame);
midi2lualabel["BorderSizePixel"] = 3;
midi2lualabel["TextSize"] = 14;
midi2lualabel["TextColor3"] = Color3.fromRGB(255, 255, 255);
midi2lualabel["BackgroundColor3"] = Color3.fromRGB(208, 49, 44);
midi2lualabel["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
midi2lualabel["Size"] = UDim2.new(0, 218, 0, 50);
midi2lualabel["BorderColor3"] = Color3.fromRGB(255, 255, 255);
midi2lualabel["Text"] = [[wanna convert MIDI files into autoplay scripts? use my new website, MIDI2LUA!]];
midi2lualabel["TextWrapped"] = true;

local midi2lua = Instance.new("TextButton", frame);
midi2lua["BorderSizePixel"] = 3;
midi2lua["TextSize"] = 14;
midi2lua["TextColor3"] = Color3.fromRGB(255, 255, 255);
midi2lua["BackgroundColor3"] = Color3.fromRGB(80, 80, 80);
midi2lua["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
midi2lua["Size"] = UDim2.new(0, 218, 0, 25);
midi2lua["BorderColor3"] = Color3.fromRGB(255, 255, 255);
midi2lua["Text"] = [[copy link to MIDI2LUA]];
midi2lua["TextWrapped"] = true;

midi2lua.MouseButton1Click:Connect(function()
    setclipboard("https://bit.ly/midi2lua")
    playSound("6493287948", 0.1) 
    NotificationLibrary:SendNotification("Success", "MIDI2LUA link copied.", 1) return
end)

local copydiscord = Instance.new("TextButton", frame);
copydiscord["BorderSizePixel"] = 3;
copydiscord["TextSize"] = 14;
copydiscord["TextColor3"] = Color3.fromRGB(255, 255, 255);
copydiscord["BackgroundColor3"] = Color3.fromRGB(80, 80, 80);
copydiscord["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
copydiscord["Size"] = UDim2.new(0, 218, 0, 25);
copydiscord["BorderColor3"] = Color3.fromRGB(255, 255, 255);
copydiscord["Text"] = [[copy discord server link]];
copydiscord["TextWrapped"] = true;

copydiscord.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/MP9nZgEeQD")
    playSound("6493287948", 0.1) 
    NotificationLibrary:SendNotification("Success", "Discord link copied.", 1) return
end)

-- Create the cancel button
local cancelButton = Instance.new("TextButton")
cancelButton.Size = UDim2.new(0, 218, 0, 30)
cancelButton.AnchorPoint = Vector2.new(1, 0)
cancelButton.Text = "dismiss"
cancelButton.BackgroundColor3 = Color3.fromRGB(208, 49, 44)
cancelButton.BorderSizePixel = 3
cancelButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
cancelButton.TextSize = 30
cancelButton.FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
cancelButton.Parent = frame

-- Function for the cancel button (closes the popup)
cancelButton.MouseButton1Click:Connect(function()
    screengui:Destroy()
end)
