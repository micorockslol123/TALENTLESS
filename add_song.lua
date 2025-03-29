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

local newsongframe = Instance.new("Frame", screengui);
newsongframe["BorderSizePixel"] = 0;
newsongframe["BackgroundColor3"] = Color3.fromRGB(47, 47, 47);
newsongframe["Size"] = UDim2.new(0, 254, 0, 326);
newsongframe["Position"] = UDim2.new(0.40062, 0, 0.28553, 0);
newsongframe["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.ScreenGui.Frame.TextBox
local insertscript = Instance.new("TextBox", newsongframe);
insertscript["CursorPosition"] = -1;
insertscript["BorderSizePixel"] = 3;
insertscript["TextSize"] = 14;
insertscript["TextColor3"] = Color3.fromRGB(255, 255, 255);
insertscript["BackgroundColor3"] = Color3.fromRGB(80, 80, 80);
insertscript["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
insertscript["PlaceholderText"] = "Paste the script here [MAKE SURE YOU PASTE THE FULL AND EXACT SCRIPT YOU GET FROM MIDI2LUA]";
insertscript["Size"] = UDim2.new(0, 218, 0, 123);
insertscript["Position"] = UDim2.new(0.07087, 0, 0.25767, 0);
insertscript["BorderColor3"] = Color3.fromRGB(255, 255, 255);
insertscript["Text"] = [[]];
insertscript["TextWrapped"] = true;-- StarterGui.ScreenGui.Frame


-- StarterGui.ScreenGui.Frame.TextLabel
local newsongLabel = Instance.new("TextLabel", newsongframe);
newsongLabel["TextWrapped"] = true;
newsongLabel["BorderSizePixel"] = 3;
newsongLabel["TextSize"] = 18;
newsongLabel["BackgroundColor3"] = Color3.fromRGB(208, 49, 44);
newsongLabel["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
newsongLabel["TextColor3"] = Color3.fromRGB(255, 255, 255);
newsongLabel["Size"] = UDim2.new(0, 218, 0, 50);
newsongLabel["BorderColor3"] = Color3.fromRGB(255, 255, 255);
newsongLabel["Text"] = [[Insert your song script and the name of your song.]];
newsongLabel["Position"] = UDim2.new(0.07087, 0, 0.05521, 0);


-- StarterGui.ScreenGui.Frame.TextBox
local insertsongName = Instance.new("TextBox", newsongframe);
insertsongName["CursorPosition"] = -1;
insertsongName["BorderSizePixel"] = 3;
insertsongName["TextWrapped"] = true;
insertsongName["TextSize"] = 22;
insertsongName["TextColor3"] = Color3.fromRGB(255, 255, 255);
insertsongName["BackgroundColor3"] = Color3.fromRGB(80, 80, 80);
insertsongName["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
insertsongName["PlaceholderText"] = [[Insert song name...]];
insertsongName["Size"] = UDim2.new(0, 218, 0, 32);
insertsongName["Position"] = UDim2.new(0.07087, 0, 0.69325, 0);
insertsongName["BorderColor3"] = Color3.fromRGB(255, 255, 255);
insertsongName["Text"] = [[]];


-- StarterGui.ScreenGui.Frame.TextButton
local submitSong = Instance.new("TextButton", newsongframe);
submitSong["BorderSizePixel"] = 0;
submitSong["TextColor3"] = Color3.fromRGB(255, 255, 255);
submitSong["TextSize"] = 43;
submitSong["BackgroundColor3"] = Color3.fromRGB(78, 197, 53);
submitSong["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
submitSong["Size"] = UDim2.new(0, 218, 0, 41);
submitSong["BorderColor3"] = Color3.fromRGB(0, 0, 0);
submitSong["Text"] = [[SUBMIT!]];
submitSong["Position"] = UDim2.new(0.07087, 0, 0.83436, 0);

-- Create the cancel button
local cancelButton = Instance.new("TextButton")
cancelButton.Size = UDim2.new(0, 40, 0, 40)
cancelButton.AnchorPoint = Vector2.new(1, 0)
cancelButton.Position = UDim2.new(1, 10, 0, -10)
cancelButton.Text = "X"
cancelButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
cancelButton.BorderSizePixel = 1
cancelButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
cancelButton.TextSize = 45
cancelButton.FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
cancelButton.Parent = newsongframe

-- Function for the cancel button (closes the popup)
cancelButton.MouseButton1Click:Connect(function()
    newsongframe.Visible = false
end)



-- Function for the submit button (gets the script and song name)
submitSong.MouseButton1Click:Connect(function()
    local scriptInput = insertscript.Text
    local songName = insertsongName.Text
    
    local folderExists = false
    
    for _, file in ipairs(listfiles()) do
        if file == [[\TALENTLESS_CUSTOM_SONGS]] then
            folderExists = true
            break
        end
    end

if not folderExists then
    makefolder("TALENTLESS_CUSTOM_SONGS")
end

songexists = false

for _, file in ipairs(listfiles([[\TALENTLESS_CUSTOM_SONGS]])) do
	if file == [[/TALENTLESS_CUSTOM_SONGS\]] .. songName .. ".txt" then -- if there is already a file with path//name /TALENTLESS_CUSTOM_SONGS\songname.txt then
        playSound("6493287948", 0.1) 
        NotificationLibrary:SendNotification("Error", "You already have a song with this name.", 3)
        songexists = true -- song does exist
        break
    end
end

if not songexists then
    writefile("TALENTLESS_CUSTOM_SONGS/" .. songName .. ".txt", scriptInput) -- write the file in the song folder as a .txt
    playSound("6493287948", 0.1) 
    NotificationLibrary:SendNotification("Success", "You have added the song " .. songName .. ". Re-execute the script to see it.", 10)
    insertscript.Text = ""
    insertsongName.Text = ""
end

end)
