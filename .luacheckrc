std = "max+busted+eso"
stds.eso = {
    globals = {
        "d",
        "EVENT_ADD_ON_LOADED",
        "EVENT_MANAGER",
        "GetCVar",
        "ZO_GenerateCommaSeparatedList",
        "zo_strformat",
    },
}
self = false
exclude_files = {
    "Test/ESOUI.lua",
}
include_files = {
    "Lib/**/*.lua",
    "Test/**/*.lua"
}