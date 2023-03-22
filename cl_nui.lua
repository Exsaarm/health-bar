--- Todo: NUI
NUI = {}

healthBarEnabled = false
---@type function
---@param shouldShow boolean
local function toggleNuiFrame(shouldShow)
    SendNUIMessage({
        action = "setVisible",
        data = shouldShow
    })

    healthBarEnabled = shouldShow
end

---@type function
---@param visible boolean
function NUI:Toggle(visible)
    toggleNuiFrame(visible)
	healthBarEnabled = visible
end

---@type function
---@param cb function
RegisterNUICallback("hideFrame", function(_, cb)
    toggleNuiFrame(false)
    cb({})
end)
