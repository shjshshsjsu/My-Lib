local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shjshshsjsu/My-Lib/main/Source.lua", true))()
local window = lib:Window('title here')

window:Toggle('toggle', function(enabled)
     print(enabled)
end)

window:Button('Button', function(enabled)
     print(Button)
end)


