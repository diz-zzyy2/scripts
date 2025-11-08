--[[ DIZZY Animation Stealer ]]--

print("DIZZY Animation Logger")

print("All animations will be in game.SavedAnimations")

local f = game:FindFirstChild("SavedAnimations") or Instance.new("Folder")
f.Name = "SavedAnimations"
f.Parent = game

local s = f["DIZZY"] or Instance.new("Folder")
f.Name = "DIZZY"
f.Parent = f
f.Source = [[
------------------------------
-- DIZZYS ANIMATION STEALER
------------------------------
-- CONTACT ME REGARDING ANY ISSUES!

-- DISCORD: @yoo_dizzy
-- GITHUB PAGE: https://github.com/diz-zzyy2
------------------------------
-- ENJOY SKIDS
------------------------------
]]

function run()
  while true do
    local character = game.Players.LocalPlayer.Character
	if not character then print("No character!") return end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then print("No humanoid!") return end
	local animator = humanoid:FindFirstChildOfClass("Animator")
	if not animator then print("No animator!") return end
    local p = animator:GetPlayingAnimationTracks()

	if(_G.DIZAnimStealer ~= nil) then
  		if(_G.DIZAnimStealer.CurrentlyRunning ~= true) then
    		_G.DIZAnimStealer.CurrentlyRunning = true
 		else return end
	else print("An Instance of is already running. Set CurrentlyRunning to force another instance.") return end

    print("Searching for animations.")
    for _,t in ipairs(p) do
		if(t.Animation) then
			local a = t.Animation
		else print("Not valid Animation!") return
		end
			
        if(string.find(a.AnimationId, "rbxassetid") == false and not f:FindFirstChild(a.Name .. tostring(a.AnimationId))) then
            print("Animation found: " .. a.Name .. " ~ " .. a.AnimationId)
			local s = game:GetObjects(a.AnimationId)[1]
			if s then
                s.Parent = f
                s.Name = a.Name .. tostring(a.AnimationId)
                print("Animation saved: " .. a.Name .. " ~ " .. a.AnimationId)
            else
                print("Failed to retrieve object for Animation " .. a.AnimationId .."//" .. )
            end
        end
    end
      wait(_G.DIZAnimStealer.TimeBetweenSearches)
  end
end

function saver()
  repeat wait(1) until _G.DIZAnimStealer.SaveContent == true
  local Params = {
    RepoURL = "https://raw.githubusercontent.com/luau/UniversalSynSaveInstance/main/",
    SSI     = "saveinstance"
  }
  local synsaveinstance = loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()

  local Options = {
    mode = "invalid",
    ExtraInstances         = {game.SavedAnimations},
    Noscripts             = false,
    ShowStatus            = true,
  }

  synsaveinstance(Options)
end

saver()
run()
