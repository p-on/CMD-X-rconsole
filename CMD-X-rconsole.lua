__disable = false
__old = hookfunction(Instance.new, function(a, b)
    if checkcaller() and a == "ScreenGui" and b == game:GetService("CoreGui").RobloxGui and not __disable then
        return __old(a, nil)
    end
    return __old(a, b)
end)

coroutine.resume(coroutine.create(function()
    repeat
        pcall(function()
            RunDude = true
        end)
        task.wait()
    until nil
end))

loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()    

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

repeat
    local a = rconsoleinputasync()
    coroutine.resume(coroutine.create(function()
        executeCommand(a)
        rconsoleprint("> ")
    end))
until not holder
rconsoleprint("\n")
