---@diagnostic disable: deprecated
local Lib = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"))
while not Lib.Loaded do
    game:GetService("RunService").Heartbeat:Wait();
end;
if game:GetService("CoreGui"):FindFirstChild("Plutex Hub") then
        for i = 0,5 do
            game:GetService("CoreGui")["Plutex Hub"]:Destroy()
            Lib.Message.New("Another menu is found. \n Please execute again.")
        end
end

if not game:IsLoaded() then
    game.Loaded:Wait()
 end

 local Lib = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"))

 Lib.Signal.Fire("Fireworks Animation", Lib.LocalPlayer);
 Lib.Message.New("Thank you for using \nPlutex Hub :)")

 wait(1)

 local Luxtl = loadstring(game:HttpGet("https://raw.githubusercontent.com/Dextyerz/UI/main/UI.lua"))()
 local Luxt = Luxtl.CreateWindow("Plutex Hub")
 local vu = game:service'VirtualUser'

 local mainTab = Luxt:Tab("Utility")
 local cre = mainTab:Section("Main Credits")
 cre:Label("Script Made by SkyLi000 & Dextyerz")
 cre:Label("UI Made by Luxt")
 local ply = mainTab:Section("Players")
 ply:Slider("WalkSpeed", 16, 503, function(currentValue)
     game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = currentValue
 end)
 ply:Slider("JumpPower", 16, 503, function(currentValue)
     game.Players.LocalPlayer.Character.Humanoid.JumpPower = currentValue
 end)
 local gm = mainTab:Section("Game")
 gm:Toggle("Anti AFK", function()
    getgenv().antiafk = true;
 end)
 gm:Toggle("Stats Tracker", function(stats)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Dextyerz/Roblox/main/StatTracker.lua'))()
 end)
 gm:Button("3x Speed Hoverboard", function()
    getgenv().morespeed = true;
 end)
 gm:Button("Cap FPS to 10", function()
    setfpscap(10)
 end)
 gm:Button("Cap FPS to 60", function()
    setfpscap(60)
 end)
 gm:Button("Reequip Pets", function() 
    local PetIds = {}
    local function getPetId() 
        for index, value in next, getgc(true) do 
            if type(value) == "table" and rawget(value, "uid") and tostring(value.owner) == tostring(game.Players.LocalPlayer) then 
                table.insert(PetIds, value.uid)
            end
        end
    end
    getPetId()

    local function ReEquip()
        for _, ID in next, PetIds do
            Lib.Network.Invoke("unequip pet", ID)
        end
        for _, ID in next, PetIds do
            Lib.Network.Invoke("equip pet", ID)
        end
    end
    ReEquip()
 end)

local tele = mainTab:Section("Teleport Worlds")
local telelist = {"Spawn World", "Fantasy World", "Tech World", "Void World", "Axolotl Ocean"}
tele:DropDown("Select Worlds", telelist, function(tworld)
    if tworld == "Spawn World" then
        Lib.WorldCmds.Load("Spawn");
    end
    if tworld == "Fantasy World" then
        Lib.WorldCmds.Load("Fantasy")
    end
    if tworld == "Tech World" then
        Lib.WorldCmds.Load("Tech")
    end
    if tworld == "Void World" then
        Lib.WorldCmds.Load("Void")
    end
    if tworld == "Axolotl Ocean" then
        Lib.WorldCmds.Load("Axolotl Ocean")
    end
end)

local page = Luxt:Tab("Auto Eggs")
local eggs1 = page:Section("Auto Hatch Settings")
local spawnegg = page:Section("Spawn Eggs")
local fantasyegg = page:Section("Fantasy Eggs")
local techegg = page:Section("Tech Eggs")
local axolotlegg = page:Section("Axolotl Eggs")


local pathToScript = game.Players.LocalPlayer.PlayerScripts.Scripts.Game['Open Eggs']
local oldFunc = getsenv(pathToScript).OpenEgg
local SEggs = {} 
for i,v in pairs(game.ReplicatedStorage.Game.Eggs["Spawn Eggs"]:GetChildren()) do 
        table.insert(SEggs, v.Name)
end
local FEggs = {} 
for i,v in pairs(game.ReplicatedStorage.Game.Eggs["Fantasy Eggs"]:GetChildren()) do 
        table.insert(FEggs, v.Name)
end
local TEggs = {} 
for i,v in pairs(game.ReplicatedStorage.Game.Eggs["Tech Eggs"]:GetChildren()) do 
        table.insert(TEggs, v.Name)
end
local AEggs = {} 
for i,v in pairs(game.ReplicatedStorage.Game.Eggs["Axolotl Ocean"]:GetChildren()) do 
        table.insert(AEggs, v.Name)
end
spawnegg:DropDown("Select egg", SEggs, function(eggor)
    if eggor then
        _G.Egg = eggor
        print(eggor)
        print(_G.Egg)
    end
end)
fantasyegg:DropDown("Select egg", FEggs, function(eggor)
    if eggor then
        _G.Egg = eggor
    end
end)
techegg:DropDown("Select egg", TEggs, function(eggor)
    if eggor then
        _G.Egg = eggor
    end
end)
axolotlegg:DropDown("Select Egg", AEggs, function(eggor)
     if eggor then
        _G.Egg = eggor
    end
end)
eggs1:Toggle("Auto Hatch", function(dropegg)
    shared.toggle3drop = dropegg
    end)
    local openeegg = eggor
    game:GetService("RunService").RenderStepped:connect(function()
    if shared.toggle3drop then
        Lib.Network.Invoke("buy egg", _G.Egg, _G.TripleEgg)
        wait(3)
        end
    end)
    eggs1:Toggle("Skip Hatch Animation", function(delanimation)
        if delanimation == true then 
            getsenv(pathToScript).OpenEgg = function() return end 
        else
            getsenv(pathToScript).OpenEgg = oldFunc
        end 
    end)
    

    eggs1:Toggle("Triple Egg", function(triplegamepass)
    
    if triplegamepass == true then
        _G.TripleEgg = true
    elseif triplegamepass == false or destroygui then
        _G.TripleEgg = false
        end
    end)
    
    _G.TripleEgg = false
    
    eggs1:Button("Check How Many Egg Opened", function()
        Lib.Message.New("Opened " ..Lib.Save.Get().EggsOpened[_G.Egg])
    end)

    local guiTab = Luxt:Tab("GUIs")
    local guii = guiTab:Section("Bank")
    guii:Button("Bank", function()
       game:GetService("Players").LocalPlayer.PlayerGui.Bank.Enabled = true
    end)
    local guii = guiTab:Section("Enchant")
    guii:Button("Enchant", function()
       game:GetService("Players").LocalPlayer.PlayerGui.EnchantPets.Enabled = true
    end)
    local guii = guiTab:Section("Fuse")
    guii:Button("Fuse", function()
       game:GetService("Players").LocalPlayer.PlayerGui.FusePets.Enabled = true
    end)
    local guii = guiTab:Section("Pet Collection")
    guii:Button("Pet Collection", function()
       game:GetService("Players").LocalPlayer.PlayerGui.Collection.Enabled = true
    end)
    local guii = guiTab:Section("Upgrades")
    guii:Button("Upgrades", function()
       game:GetService("Players").LocalPlayer.PlayerGui.Upgrades.Enabled = true
    end)
    local guii = guiTab:Section("Golden Machine")
    guii:Button("Golden Machine", function()
       game:GetService("Players").LocalPlayer.PlayerGui.Golden.Enabled = true
    end)
    local guii = guiTab:Section("Rainbow Machine")
    guii:Button("Rainbow Machine", function()
       game:GetService("Players").LocalPlayer.PlayerGui.Rainbow.Enabled = true
    end)
    local guii = guiTab:Section("Dark Matter")
    guii:Button("Dark Matter", function()
       game:GetService("Players").LocalPlayer.PlayerGui.DarkMatter.Enabled = true
    end)
    local guii = guiTab:Section("Merchant")
    guii:Button("Merchant", function()
       game:GetService("Players").LocalPlayer.PlayerGui.Merchant.Enabled = true
    end)

    local misctab = Luxt:Tab("Misc")
    local fakeh = misctab:Section("Fake Hatcher")
    fakeh:TextBox("Fake Hatcher", "Pets Name", function(Pets)
        function HatchEgg(Pet)
            local state = ''
            if string.find(Pet, 'Golden') then 
                state = 'gold'
                Pet = string.gsub(Pet, 'Golden ', '')
            elseif string.find(Pet, 'Rainbow') then 
                state = 'rainbow'
                Pet = string.gsub(Pet, 'Rainbow ', '')
            elseif string.find(Pet, 'Dark Matter') then
                state = 'darkmatter'
                Pet = string.gsub(Pet, 'Dark Matter ', '')
            else 
                state = 'normal'
            end
            local pet = Pet
            for i,v in pairs(game.ReplicatedStorage.Game.Pets:GetChildren()) do
                if string.split(tostring(v), ' - ')[2] == pet then
                    pet = string.split(tostring(v), ' - ')[1]
                end
            end
            local tbl = {
                {
                nk = 'Preston',
                idt = '69',
                e = false,
                uid = '69',
                s = 999999999999,
                id = pet,
            }}
            local g_tbl = {
                {
                nk = 'Preston',
                idt = '69',
                e = false,
                g = true,
                uid = '69',
                s = 999999999999,
                id = pet,
            }} 
            local r_tbl = {
                {
                nk = 'Preston',
                idt = '69',
                e = false,
                r = true,
                uid = '69',
                s = 999999999999,
                id = pet,
            }}
            local dm_tbl = {
                {
                nk = 'Preston',
                idt = '69',
                e = false,
                dm = true,
                uid = '69',
                s = 999999999999,
                id = pet,
            }} 
            local egg
            for i_,script in pairs(game.ReplicatedStorage.Game.Eggs:GetDescendants()) do
                if script:IsA('ModuleScript') then
                    if typeof(require(script).drops) == 'table' then
                        for i,v in pairs(require(script).drops) do
                            if v[1] == pet then
                                egg = require(script).displayName
                            end
                        end
                    end
                end
            end
            if Pet == 'Huge Pegasus' then egg = 'Cracked Egg' 
            elseif Pet == 'Huge Cat' then egg = 'Cracked Egg' end
            for i,v in pairs(getgc(true)) do
                if (typeof(v) == 'table' and rawget(v, 'OpenEgg')) then
                    if state == 'normal' then
                        v.OpenEgg(egg, tbl)
                    else 
                        if state == 'gold' then 
                            v.OpenEgg(egg, g_tbl)
                        elseif state == 'rainbow' then 
                            v.OpenEgg(egg, r_tbl) 
                        elseif state == 'darkmatter' then 
                            v.OpenEgg(egg, dm_tbl)
                        end 
                    end 
                end
            end
        end
        
        HatchEgg(Pets)
        
    end)
    local misc = misctab:Section("Misc")
    misc:Button("Summon Firework", function()
        Lib.Signal.Fire("Fireworks Animation", Lib.LocalPlayer);
    end)
    misc:TextBox("Message GUI", "Message Here", function(themessage)
        Lib.Message.New(themessage)
    end)
    local settingu = misctab:Section("UI Settings")
    settingu:Button("Destroy Menu", function(destroygui)
        game:GetService("CoreGui")["Plutex Hub"]:Destroy()
    end)
    local PlayerList = {} 

    for i,v in pairs(game.Players:GetChildren()) do 
            table.insert(PlayerList, v.Name)
    end
    local PSpoofer = misctab:Section("Player Spoofer")
    PSpoofer:DropDown("Select player", PlayerList, function(LOL)
        if LOL then
            getgenv()["PlayerSPOOF___"] = LOL
        end
    end)
    PSpoofer:Button("Spoof Selected Player", function()
        local Player2Spoof = PlayerSPOOF___
        game:GetService("ReplicatedStorage").Framework.Modules["2 | Network"]["new stats"]:Fire(Lib.Network.Invoke('Get Stats', game:GetService('Players')[Player2Spoof]), game.Players.LocalPlayer)
        end)
    PSpoofer:Button("Unspoof Player", function()
        game:GetService("ReplicatedStorage").Framework.Modules["2 | Network"]["new stats"]:Fire(Lib.Network.Invoke('Get Stats', game:GetService('Players').LocalPlayer), game.Players.LocalPlayer)
    end)


    if getgenv().antiafk == true then
local GC = getconnections or get_signal_cons
if GC then
    for i,v in pairs(GC(game.Players.LocalPlayer.Idled)) do
        if v["Disable"] then
            v["Disable"](v)
        elseif v["Disconnect"] then
            v["Disconnect"](v)
        end
    end
else
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end

    local VirtualUser=game:service'VirtualUser'
    game:service'Players'.LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    end)
end

    if getgenv().morespeed == true then
        for i,v in pairs(game:GetService("ReplicatedStorage").Game.Hoverboards:GetChildren()) do
            local modul = nil
            for k,e in pairs(v:GetChildren()) do
                if string.find(e.Name,"Data") then
                    modul = e
                end
            end
            if modul ~= nil then
                local s = require(modul)
                s["speed"] = 3
            else
                warn("no module found")
                    end
                end
    end