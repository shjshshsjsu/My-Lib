VERY BAD BTW, I DID IT SOME YEARS AGO AND STOPPED SUDDENLY

Usage
```csharp
Window(<string> title)
   Toggle(<string> text, <function> callback)
   Slider(<string> text, <table> options {max, default}, <function> callback)
```
  
Example
```lua
local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/loglizzy/lib/main/main.lua'))()
local window = lib:Window('title here')

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
