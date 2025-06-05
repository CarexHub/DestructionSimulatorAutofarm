getfenv().config = {
    ["AutoSell"] = true,
    ["Area"] = "Area1",
    ["FixLag"] = true,
    ["StealthMode"] = false
}

--dev only config
getfenv().Dev = true

loadstring(game:HttpGet("https://raw.githubusercontent.com/CarexHub/Misc/refs/heads/main/Misc.lua"))()

--functions
function Explode(Position)
    local remote = game:GetService("ReplicatedStorage").Remotes.explodeRocket

    local arguments = {
    [1] = 0,
    [2] = workspace[game.Players.LocalPlayer.Name].Launcher.Stats,
    [3] = Position,
    [4] = workspace[game.Players.LocalPlayer.Name].Launcher.Assets.Rocket.Boom
    }

    remote:FireServer(unpack(arguments))
end

function SellBricks()
    local remote = game:GetService("ReplicatedStorage").Remotes.sellBricks
    remote:FireServer()
end

function RankUp()
    local remote = game:GetService("ReplicatedStorage").Remotes.rankUp
    remote:FireServer()
end

function DetectArea()
    
end

function EnterArea(Area)
    local remote = game:GetService("ReplicatedStorage").Remotes.areaChanged

    local arguments = {
	    [1] = Area
    }

    remote:FireServer(unpack(arguments))
end

function ExplodeArea(Area)
    EnterArea(Area)
    local Parts = {}
    for _, Model in pairs(game.Workspace.Areas[Area]:GetChildren()) do
        if Model:IsA("Model") then
            Model:WaitForChild("Destructible")
            if Model.Destructible == false then
                continue
            end
            for _, Part in pairs(Model:GetChildren()) do
                if Part:IsA("Part") and Part.Name ~= "Counted" and Part.Name ~= "Base" then
                    table.insert(Parts, Part)
                    if Part:GetAttribute("Setted") ~= true and getfenv().config["FixLag"] == true then
                        Part:SetAttribute("Setted", true)
                        Part.Changed:Connect(function(propety)
                            if Part[propety] == "Counted" then
                                Part:Destroy()
                            end
                        end)
                    end
                end
            end
        end
    end
    if getfenv().config["AutoSell"] == true then
        SellBricks()
    end
    if #Parts <= 10 then
        Explode(Parts[math.random(1, #Parts)].Position)
    end
end
--[[while true do
    task.wait()
    ExplodeArea("Area6")
end]]