local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "TWR",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "TWR",
    IntroText = "Made by TWR Team.",
    IntroIcon = "rbxassetid://17460077785"
})

OrionLib:MakeNotification({
    Name = "TWR",
    Content = "Successfully loaded! V1.0",
    Image = "rbxassetid://4483345998",
    Time = 10
})

-- About Tab
local About = Window:MakeTab({
    Name = "About",
    Icon = "rbxassetid://17460420936",
    PremiumOnly = false
})

-- Section About
local Section = About:AddSection({
    Name = "About"
})

-- Paragraph About
About:AddParagraph("Join our Discord!", "discord.gg/R57rsmdAzk")
About:AddParagraph("TWR V1.0", "Still under Development!")
About:AddParagraph("Owners:", "Rave (main owner), Tw.Piece")
About:AddParagraph("Developers:", "AhmadV10")
-- // Local // --
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Workspace = game:GetService("Workspace")
local SellArea = Workspace.sellAreaCircles
local PlrChar = Player.Character or Player.CharacterAdded:Wait()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Valley = Workspace:WaitForChild("spawnedCoins"):WaitForChild("Valley")

-- // Functions // --
local function NewToggle(Tab, Name, Default)
    Tab:AddToggle({Name = Name, Default = Default, Callback = function(Value) getgenv()[Name] = Value end})
end

local function GetChi()
    for _, Chi in pairs(Valley:GetChildren()) do
        if string.find(Chi.Name, "Chi") then 
            return Chi
        end
    end
end

local function WaitChilds(Path, ...)
    return Path:WaitForChild(..., 10)
end

local function Hoops()
    for _, Part in pairs(Workspace.Hoops:GetDescendants()) do
        if Part.ClassName == "MeshPart" then
            return Part
        end
    end
end

local function GetCoins()
    for _, Coin in pairs(Valley:GetChildren()) do
        if string.find(Coin.Name, "Coin") or string.find(Coin.Name, "Coins") then 
            return Coin
        end
    end
end
local TableIsland = {}
for _, Island in pairs(Workspace.islandUnlockParts:GetChildren()) do
    table.insert(TableIsland, Island.Name)
end
local bossFolder = WaitChilds(Workspace, "bossFolder")
local Crystals = {}
for _, v in ipairs(Workspace.mapCrystalsFolder:GetChildren()) do
    table.insert(Crystals, v.Name)
end
local petsFolder = WaitChilds(Player, "petsFolder")

-- // Loop // --
local function Loop()
    while task.wait(1) do
        local Success, Error = pcall(function()
            if getgenv()["Auto Swing"] then
                Player.ninjaEvent:FireServer("swingKatana")
                task.wait(0.2)
            end
            if getgenv()["Auto Sell"] then
                if Character:FindFirstChild("HumanoidRootPart") then
                    SellArea["sellAreaCircle7"].circleInner.CFrame = Character.HumanoidRootPart.CFrame
                    task.wait()
                    SellArea["sellAreaCircle7"].circleInner.CFrame = WorkSpace.Part.CFrame
                    task.wait(0.2)
                end
            end
            if getgenv()["Auto Sell [Fully]"] then
                if Character:FindFirstChild("HumanoidRootPart") then
                    if Player.PlayerGui.gameGui.maxNinjitsuMenu.Visible then
                        SellArea["sellAreaCircle7"].circleInner.CFrame = Character.HumanoidRootPart.CFrame
                        task.wait()
                        SellArea["sellAreaCircle7"].circleInner.CFrame = WorkSpace.Part.CFrame
                        task.wait(0.2)
                    end
                end
            end
            if getgenv()["Auto Farm Coins"] then
                local Coins = GetCoins()
                if Coins and Character:FindFirstChild("HumanoidRootPart") then
                    Character.HumanoidRootPart.CFrame = CFrame.new(Coins.Position)
                    task.wait(0.2)
                end
            end
            if getgenv()["Auto Collect Chi"] then
                local Chi = GetChi()
                if Chi and Character:FindFirstChild("HumanoidRootPart") then
                    Character.HumanoidRootPart.CFrame = CFrame.new(Chi.Position)
                    task.wait(0.2)
                end
            end
            if getgenv()["Auto Robot Boss"] then
                local HumanoidRootPart = WaitChilds(PlrChar, "HumanoidRootPart")
                local RobotBoss = WaitChilds(BossFolder, "RobotBoss")
                local HumanoidRootPartBoss = WaitChilds(RobotBoss, "HumanoidRootPart")
                local Humanoid = PlrChar:FindFirstChildOfClass("Humanoid")
                if HumanoidRootPart and HumanoidRootPartBoss then
                    HumanoidRootPart.CFrame = HumanoidRootPartBoss.CFrame
                    if PlrChar:FindFirstChildOfClass("Tool") then
                        PlrChar:FindFirstChildOfClass("Tool"):Activate()
                    else
                        for _, Item in pairs(Player.Backpack:GetChildren()) do
                            if Item:IsA("Tool") and Item:FindFirstChild("attackKatanaScript") then
                                Item.attackTime.Value = 0.2
                                Humanoid:EquipTool(Item)
                                break
                            end
                        end
                    end
                    task.wait(0.2)
                end
            end
            if getgenv()["Auto Eternal Boss"] then
                local EternalBoss = WaitChilds(bossFolder, "EternalBoss")
                local HumanoidRootPartBoss = WaitChilds(EternalBoss, "HumanoidRootPart")
                local RootPart = WaitChilds(PlrChar, "HumanoidRootPart")
                if RootPart and HumanoidRootPartBoss then
                    RootPart.CFrame = HumanoidRootPartBoss.CFrame
                    if PlrChar:FindFirstChildOfClass("Tool") then
                        PlrChar:FindFirstChildOfClass("Tool"):Activate()
                    else
                        for _, Item in pairs(Player.Backpack:GetChildren()) do
                            if Item:IsA("Tool") and Item:FindFirstChild("attackKatanaScript") then
                                Item.attackTime.Value = 0.2
                                PlrChar.Humanoid:EquipTool(Item)
                                break
                            end
                        end
                    end
                    task.wait(0.2)
                end            
            end
            if getgenv()["Auto Anchient Boss"] then
                local HumanoidRootPart = WaitChilds(PlrChar, "HumanoidRootPart")
                local AncientMagmaBoss = WaitChilds(bossFolder, "AncientMagmaBoss")
                local HumanoidRootPartBoss = WaitChilds(AncientMagmaBoss, "HumanoidRootPart")
                if HumanoidRootPart and HumanoidRootPartBoss then
                    HumanoidRootPart.CFrame = HumanoidRootPartBoss.CFrame
                    if PlrChar:FindFirstChildOfClass("Tool") then
                        PlrChar:FindFirstChildOfClass("Tool"):Activate()
                    else
                        for _, item in pairs(Player.Backpack:GetChildren()) do
                            if item:IsA("Tool") and item:FindFirstChild("attackKatanaScript") then
                                item.attackTime.Value = 0.2
                                PlrChar.Humanoid:EquipTool(item)
                                break
                            end
                        end
                    end
                    task.wait(0.2)
                end
            end
            if getgenv()["Auto Samurai Santa Boss"] then
                local HumanoidRootPart = WaitChilds(PlrChar, "HumanoidRootPart")
                local SamuraiSanta = WaitChilds(bossFolder, "Samurai Santa")
                local HumanoidRootPartBoss = WaitChilds(SamuraiSanta, "HumanoidRootPart")
                if HumanoidRootPart and HumanoidRootPartBoss then
                    HumanoidRootPart.CFrame = HumanoidRootPartBoss.CFrame
                    if PlrChar:FindFirstChildOfClass("Tool") then
                        PlrChar:FindFirstChildOfClass("Tool"):Activate()
                    else
                        for _, item in pairs(Player.Backpack:GetChildren()) do
                            if item:IsA("Tool") and item:FindFirstChild("attackKatanaScript") then
                                item.attackTime.Value = 0.2
                                PlrChar.Humanoid:EquipTool(item)
                                break
                            end
                        end
                    end
                    task.wait(0.2)
                end
            end
            if getgenv()["Auto Hoops"] then
                local Hoops = Hoops()
                if Hoops and Character:FindFirstChild("HumanoidRootPart") then
                    Hoops.touchPart.CFrame = Character.HumanoidRootPart.CFrame
                    task.wait(0.2)
                end
            end
            if getgenv()["Auto Buy Ranks"] then
                if Character:WaitForChild("HumanoidRootPart") then
                    for _, Rank in ipairs(ReplicatedStorage.Ranks.Ground:GetChildren()) do
                        Player.ninjaEvent:FireServer("buyRank", Rank.Name)
                        task.wait(0.2)
                    end
                end
            end
            if getgenv()["Auto Buy Shurikens"] then
                if Character:WaitForChild("HumanoidRootPart") then
                    for _, island in ipairs(TableIsland) do
                        Player.ninjaEvent:FireServer("buyAllShurikens", island)
                        task.wait(0.2)
                    end
                end
            end
            if getgenv()["Auto Buy Swords"] then
                if Character:WaitForChild("HumanoidRootPart") then
                    for _, island in ipairs(TableIsland) do
                        Player.ninjaEvent:FireServer("buyAllSwords", island)
                        task.wait(0.2)
                    end
                end
            end
            if getgenv()["Auto Buy Skills"] then
                if Character:WaitForChild("HumanoidRootPart") then
                    for _, island in ipairs(TableIsland) do
                        Player.ninjaEvent:FireServer("buyAllSkills", island)
                        task.wait(0.2)
                    end
                end
            end
            if getgenv()["Auto Buy Belts"] then
                if Character:WaitForChild("HumanoidRootPart") then
                    for _, island in ipairs(TableIsland) do
                        Player.ninjaEvent:FireServer("buyAllBelts", island)
                        task.wait(0.2)
                    end
                end
            end
            for _, CrystalName in ipairs(Crystals) do
                if getgenv()["Auto Buy " .. CrystalName] then
                    ReplicatedStorage.rEvents.openCrystalRemote:InvokeServer("openCrystal", CrystalName)
                    task.wait(0.2)
                end
            end
            if getgenv()["Auto Evolve Pets"] then
                if Character:WaitForChild("HumanoidRootPart") then
                    for _, PetFolder in ipairs(ReplicatedStorage.rEvents.petEvolveEvent:GetChildren()) do
                        for _, Child in ipairs(PetFolder:GetChildren()) do
                            ReplicatedStorage.rEvents.petEvolveEvent:FireServer("evolvePet", Child.Name)
                            task.wait(0.2)
                        end
                    end
                end
            end
            if getgenv()["Auto Elemental Pets"] then
                if Character:WaitForChild("HumanoidRootPart") then
                    for _, PetFolder in ipairs(ReplicatedStorage.rEvents.petEternalizeEvent:GetChildren()) do
                        for _, Child in ipairs(PetFolder:GetChildren()) do
                            ReplicatedStorage.rEvents.petEternalizeEvent:FireServer("eternalizePet", Child.Name)
                            task.wait(0.2)
                        end
                    end
                end
            end
            if getgenv()["Auto Immortalize Pets"] then
                if Character:WaitForChild("HumanoidRootPart") then                
                    for _, PetFolder in ipairs(ReplicatedStorage.rEvents.petImmortalizeEvent:GetChildren()) do
                        for _, Child in ipairs(PetFolder:GetChildren()) do
                            ReplicatedStorage.rEvents.petImmortalizeEvent:FireServer("immortalizePet", Child.Name)
                            task.wait(0.2)
                        end
                    end
                end
            end
            if getgenv()["Auto Legends Pets"] then
                if Character:WaitForChild("HumanoidRootPart") then                
                    for _, PetFolder in ipairs(ReplicatedStorage.rEvents.petLegendEvent:GetChildren()) do
                        for _, Child in ipairs(PetFolder:GetChildren()) do
                            ReplicatedStorage.rEvents.petLegendEvent:FireServer("legendizePet", Child.Name)
                            task.wait(0.2)
                        end
                    end
                end
            end
            if getgenv()["Auto Sell Pets [Basics]"] then
                if Character:WaitForChild("HumanoidRootPart") then
                    local Basic = WaitChilds(petsFolder, "Basic")
                    for _, Pet in ipairs(Basic:GetChildren()) do
                        ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", Pet)
                        task.wait(0.2)
                    end
                end
            end
            if getgenv()["Auto Sell Pets [Advanced]"] then
                if Character:WaitForChild("HumanoidRootPart") then
                    local Advanced = WaitChilds(petsFolder, "Advanced")
                    for _, Pet in ipairs(Advanced:GetChildren()) do
                        ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", Pet)
                        task.wait(0.2)
                    end
                end
            end
            if getgenv()["Auto Sell Pets [Rares]"] then
                if Character:WaitForChild("HumanoidRootPart") then
                    local Rare = WaitChilds(petsFolder, "Rare")
                    for _, Pet in ipairs(Rare:GetChildren()) do
                        ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", Pet)
                    end
                end
            end
            if getgenv()["Auto Sell Pets [Epic]"] then
                if Character:WaitForChild("HumanoidRootPart") then
                    local Epic = WaitChilds(petsFolder, "Epic")
                    for _, Pet in ipairs(Epic:GetChildren()) do
                        ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", Pet)
                        task.wait(0.2)
                    end
                end
            end
            if getgenv()["Auto Sell Pets [Uniques]"] then
                if Character:WaitForChild("HumanoidRootPart") then
                    local Unique = WaitChilds(petsFolder, "Unique")
                    for _, Pet in ipairs(Unique:GetChildren()) do
                        ReplicatedStorage.rEvents.sellPetEvent:FireServer("sellPet", Pet)
                        task.wait(0.2)
                    end
                end
            end
            if getgenv()["Enable WalkSpeed 100"] then
                Character.Humanoid.WalkSpeed = 100
            else
                Character.Humanoid.WalkSpeed = 20
            end
            if getgenv()["Enable JumpPower 500"] then
                Character.Humanoid.JumpPower = 500
            else
                Character.Humanoid.JumpPower = 50
            end
            if getgenv()["No Clip"] then
                for _, Collide in pairs(Player.Character:GetDescendants()) do
                    if Collide:IsA("BasePart") then
                        Collide.CanCollide = false
                    end
                end
            end
            game.UserInputService.JumpRequest:connect(function()
                if not getgenv()["Infinites Jump"] then return end
                if getgenv()["Infinites Jump"] then
                    Character.Humanoid:ChangeState("Jumping")
                end
            end)
        end)
        if not Success then print(Error)end
    end
end;task.spawn(Loop)

-- // Creating Tabs and Toggles // --
local Main = Window:MakeTab({
    Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false
})
local Buy = Window:MakeTab({
    Name = "Buy", Icon = "rbxassetid://4483345998", PremiumOnly = false
})
local Pets = Window:MakeTab({
    Name = "Pets", Icon = "rbxassetid://4483345998", PremiumOnly = false
})
local Misc = Window:MakeTab({
    Name = "Misc", Icon = "rbxassetid://4483345998", PremiumOnly = false
})
local Func = {
    {Object = Main, Label = "Farming", Toggle = {"Auto Swing", "Auto Sell", "Auto Sell [Fully]", "Auto Farm Coins"}},
    {Object = Main, Label = "Farming Chi", Toggle = {"Auto Collect Chi"}},
    {Object = Main, Label = "Farming Boss", Toggle = {"Auto Robot Boss", "Auto Eternal Boss", "Auto Ancient Boss", "Auto Samurai Santa Boss"}},
    {Object = Main, Label = "Farming Hoops", Toggle = {"Auto Hoops"}},
    {Object = Buy, Label = "Buy Stuff", Toggle = {"Auto Buy Ranks", "Auto Buy Shurikens", "Auto Buy Swords", "Auto Buy Skills", "Auto Buy Belts"}},
    {Object = Pets, Label = "Pets Options", Toggle = {"Auto Evolve Pets", "Auto Elemental Pets", "Auto Immortalize Pets", "Auto Legends Pets"}},
    {Object = Pets, Label = "Pets Sell", Toggle = {"Auto Sell Pets [Basics]", "Auto Sell Pets [Advanced]", "Auto Sell Pets [Rares]", "Auto Sell Pets [Epic]", "Auto Sell Pets [Uniques]"}},
    {Object = Misc, Label = "Local Player", Toggle = {"Enable WalkSpeed 100", "Enable JumpPower 500", "No Clip", "Infinites Jump"}},
}
for _, Name in ipairs(Crystals) do
    table.insert(Func, {Object = Pets, Toggle = {"Auto Buy " .. Name}})
end
for _, Value in ipairs(Func) do
    Value.Object:AddLabel(Value.Label)
    for _, Name in ipairs(Value.Toggle) do
        NewToggle(Value.Object, Name, false)
    end
end
local Island = Window:MakeTab({
	Name = "island",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Island:AddSection({
	Name = "Unlocker Island"
})
Island:AddButton({
    Name = "Unlock Island",
    Callback = function()
        for _, Part in next, Workspace.islandUnlockParts:GetChildren() do 
            if Part:FindFirstChild("islandSignPart") then
                Character.HumanoidRootPart.CFrame = Part.islandSignPart.CFrame
                task.wait(0.2)
            end
        end
    end
})
Island:AddSection({
	Name = "Teleport to Island"
})
for _, Value in ipairs(TableIsland) do
    Island:AddButton({
        Name = "Teleport To" .. Value,
        Callback = function()
            local Part = Workspace.islandUnlockParts
            Character.HumanoidRootPart.CFrame = Part[Value].islandSignPart.CFrame      
        end
    })
end