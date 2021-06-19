Usage
```csharp
Window(<string> title, <bool> noduplication)
   Toggle(<string> text, <function> callback)
   Slider(<string> text, <table> options {max, default}, <function> callback)
```
  
Example
```lua
local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/loglizzy/lib/main/main.lua'))()
local window = lib:Window('title here', true)

window:Toggle('toggle', function(enabled)
     print(enabled)
end)

window:Slider('slider', {
     max = 80,
     def = 20
}, function(value)
     print(value)
end)
```
