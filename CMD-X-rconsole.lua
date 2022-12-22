__disable = false
__old = hookfunction(Instance.new, function(...)
    local args = {...}
    if checkcaller() and args[1] == "ScreenGui" and args[2] == game:GetService("CoreGui").RobloxGui and not __disable then
        print("CMD-X Gui hooked and removed")
        return __old(args[1], nil)
    end
    return __old(...)
end)

coroutine.resume(coroutine.create(function()
    print("Attempting to skip through button press check")
    repeat
        pcall(function()
            RunDude = true
        end)
        task.wait()
    until nil
end))

loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()    

print("Success, loading...")

hookfunction(opx, function(a, b) -- hook output
    if a == "*" then
        rconsoleprint("@@RED@@")
    end
    rconsoleprint("["..a.."] "..b.."\n")
    rconsoleprint("@@WHITE@@")
end)

hookfunction(opxL, function(a, b) -- hook output-larger
    rconsoleprint("@@WHITE@@")
    rconsoleprint(a.." | "..b.."\n")
end)

hookfunction(CreateCMDLabel, function(a, b, c, d, e) -- hook commands frame
    rconsoleprint("@@WHITE@@")
    rconsoleprint(a..string.rep(" ", 7 - (#tostring(a)-1)*3).."| "..b.." ("..c..")".." - "..d.." "..e.."\n")
end)

hookfunction(CreateADLabel, function(a, b) -- hook admin-detect frame
    printconsole(a.." | "..b.."\n", 255, 255, 255)
end)

hookfunction(CreateLabel, function(a, b) -- hook logs frame
    printconsole("["..a.."] | "..b.."\n", 255, 255, 255)
end)

hookfunction(CreateSCLabel, function(a, b) -- hook script-users frame
    rconsoleprint("@@WHITE@@")
    rconsoleprint("["..a.."] "..b.."\n")
end)

rconsolename("CMD-X")
rconsoleprint("@@WHITE@@")
rconsoleprint(" - Welcome to CMD-X rconsole\n - This was created by CMD-X founder pigeon (https://github.com/p-on)\n - CMD-X rconsole is an alternative for using CMD-X on Synapse X\n - Commands that contain logs will print to your internal console (INSERT key)\n")
rconsoleprint("> ")

__disable = true
print("Synapse rconsole loaded and Gui hook reversed")

repeat
    local x = rconsoleinputasync()
    coroutine.resume(coroutine.create(function()
        executeCommand(x)
        rconsoleprint("> ")
    end))
until not holder
rconsoleprint("\n")
