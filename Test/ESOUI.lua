package.path = 'dev/esoui/?.lua;' .. package.path

-- Copied from Baertrams eso api lua intellij for testing purpose.

--- @param stringVariablePrefix string
--- @param contextId number
--- @return string stringValue
function GetString(stringVariablePrefix,contextId) return "String" end

-- Replacements of internal ESO functions for testing
_G.EVENT_ADD_ON_LOADED = 0

_G.GetCVar = function(key)
    if key == "Language.2" then
        return "en"
    end
    return "undefined"
end

_G.EVENT_MANAGER = {}
function _G.EVENT_MANAGER:RegisterForEvent(_, event, func)
    if event == EVENT_ADD_ON_LOADED then
        func(event, "CleanMyChat")
    end
end
function _G.EVENT_MANAGER:UnregisterForEvent(_, _)
end
function _G.EVENT_MANAGER:RegisterForUpdate(_, _, func)
    func()
end
function _G.EVENT_MANAGER:UnregisterForUpdate(_)
end

_G.d = function(...)
    for i = 1, select('#', ...) do
        local element = select(i, ...)
        if type(element) == "table" then
            require("pl.pretty").dump(element)
        else
            print(element)
        end
    end
end

_G.zo_strformat = function(str, ...)
    local out = str
    for i=1,select('#', ...) do
        local pattern = "<<".. tostring(i) .. ">>"
        out = string.gsub(out, pattern, tostring(select(i, ...)))
    end
    return out
end

_G.ZO_GenerateCommaSeparatedList = function(tbl)
    local str = ""
    local n -- because table.getn is apparently nil
    for i, _ in ipairs(tbl) do
        n = i
    end
    for i, v in ipairs(tbl) do
        if i == 1 then
            str = v
        elseif i == n then
            str = str .. " and " .. v
        else
            str = str .. ", " .. v
        end
    end
    return str
end
