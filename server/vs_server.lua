local admins = getAdmins()
local lang = getLang("pt-BR")

-- The interval in minutes to cycle weather
local weatherTimerLimit = 60
-- Set this to false if you don't want the weather to change automatically.
local DynamicWeather = true

-------------------- DON'T CHANGE THIS --------------------
local AvailableWeatherTypes = {
    'EXTRASUNNY', 
    'CLEAR', 
    'NEUTRAL', 
    'SMOG', 
    'FOGGY', 
    'OVERCAST', 
	'THUNDER',
	'RAIN',
    'CLOUDS', 
	'XMAS',
	'BLIZZARD',
	'HALLOWEEN',
    'CLEARING', 
	'SNOWLIGHT',
	'SNOW'
}
local CurrentWeather = "CLEAR"
local baseTime = 0
local timeOffset = 0
local freezeTime = false
local blackout = false
local newWeatherTimer = 60

RegisterServerEvent('vSync:RemoteWeather')
AddEventHandler('vSync:RemoteWeather', function(weather, duration, isBlackout, dynamicWeather)
    newWeatherTimer = duration
    blackout = isBlackout
    DynamicWeather = dynamicWeather
    TriggerClientEvent('vSync:updateWeather', -1, weather, blackout)
    TriggerClientEvent('vSync:updateTime', -1, baseTime, timeOffset, freezeTime)
end)

RegisterServerEvent('vSync:requestSync')
AddEventHandler('vSync:requestSync', function()
    TriggerClientEvent('vSync:updateWeather', -1, CurrentWeather, blackout)
    TriggerClientEvent('vSync:updateTime', -1, baseTime, timeOffset, freezeTime)
end)

function isAllowedToChange(player)
    for i,id in ipairs(admins) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            TriggerEvent("VRP:Debug", string.format("admin id: %s, player id: %s", id, pid), GetCurrentResourceName())
            if string.lower(pid) == string.lower(id) then
                return true
            end
        end
    end
end

RegisterCommand('freezetime', function(source, args)
    if source ~= 0 then
        if isAllowedToChange(source) then
            freezeTime = not freezeTime
            if freezeTime then
                TriggerClientEvent('vSync:notify', source, lang.timeFreeze)
            else
                TriggerClientEvent('vSync:notify', source, lang.timeUnfreeze)
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, lang.errorNotAllowed)
        end
    else
        freezeTime = not freezeTime
        if freezeTime then
            print(lang.printTime .. lang.printFreeze)
        else
            print(lang.printTime .. lang.printUnfreeze)
        end
    end
end)

RegisterCommand('freezeweather', function(source, args)
    if source ~= 0 then
        if isAllowedToChange(source) then
            DynamicWeather = not DynamicWeather
            if not DynamicWeather then
                TriggerClientEvent('vSync:notify', source, lang.dynamicWeatherDs)
            else
                TriggerClientEvent('vSync:notify', source, lang.dynamicWeatherEn)
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, lang.errorNotAllowed)
        end
    else
        DynamicWeather = not DynamicWeather
        if not DynamicWeather then
            print(lang.printWeather .. lang.printFreeze)
        else
            print(lang.printWeather .. lang.printUnfreeze)
        end
    end
end)

RegisterCommand('weather', function(source, args)
    if source == 0 then
        local validWeatherType = false
        if args[1] == nil then
            print(lang.errorInvalidSyntax .. lang.syntaxWeather)
            return
        else
            for i,wtype in ipairs(AvailableWeatherTypes) do
                if wtype == string.upper(args[1]) then
                    validWeatherType = true
                end
            end
            if validWeatherType then
                print(lang.printWeatherUpdate)
                CurrentWeather = string.upper(args[1])
                newWeatherTimer = 60
                TriggerEvent('vSync:requestSync')
            else
                print(lang.invalidWeather)
            end
        end
    else
        if isAllowedToChange(source) then
            local validWeatherType = false
            if args[1] == nil then
                TriggerClientEvent('chatMessage', source, '', {255,255,255}, lang.errorInvalidSyntax .. lang.syntaxWeather)
            else
                for i,wtype in ipairs(AvailableWeatherTypes) do
                    if wtype == string.upper(args[1]) then
                        validWeatherType = true
                    end
                end
                if validWeatherType then
                    TriggerClientEvent('vSync:notify', source, lang.weatherChange .. ': ~y~' .. string.lower(args[1]) .. "~s~.")
                    CurrentWeather = string.upper(args[1])
                    newWeatherTimer = 60
                    TriggerEvent('vSync:requestSync')
                else
                    TriggerClientEvent('chatMessage', source, '', {255,255,255}, lang.errorInvalidWeather)
                end
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, lang.errorNotAllowed)
            print(lang.errorAcessDenied..'/weather')
        end
    end
end, false)

RegisterCommand('blackout', function(source)
    if source == 0 then
        blackout = not blackout
        if blackout then
            print(lang.printBlackoutEn)
        else
            print(lang.printBlackoutDs)
        end
    else
        if isAllowedToChange(source) then
            blackout = not blackout
            if blackout then
                TriggerClientEvent('vSync:notify', source, lang.blackoutEn)
            else
                TriggerClientEvent('vSync:notify', source, lang.blackoutDs)
            end
            TriggerEvent('vSync:requestSync')
        end
    end
end)

RegisterCommand('nexweather', function(source)
    NextWeatherStage()
end)

RegisterCommand('morning', function(source)
    setTimeOfDay(source, 9, 0)
end)

RegisterCommand('noon', function(source)
    setTimeOfDay(source, 12, 0)
end)

RegisterCommand('evening', function(source)
    setTimeOfDay(source, 18, 0)
end)

RegisterCommand('night', function(source)
    setTimeOfDay(source, 23, 0)
end)

function setTimeOfDay(source, hour, minute)
    if source == 0 then
        print(lang.errorTimeConsole)
        return
    end
    if isAllowedToChange(source) then
        ShiftToMinute(minute)
        ShiftToHour(hour)
        local text = lang.timeMorning
        if(hour >= 12) then text = lang.timeNoon end
        if(hour >= 18) then text = lang.timeEvening end
        if(hour >= 23) then text = lang.timeNight end
        TriggerClientEvent('vSync:notify', source, string.format("%s ~y~%s~s~.", lang.timeSet, text))
        TriggerEvent('vSync:requestSync')
    end
end

function ShiftToMinute(minute)
    timeOffset = timeOffset - ( ( (baseTime+timeOffset) % 60 ) - minute )
end

function ShiftToHour(hour)
    timeOffset = timeOffset - ( ( ((baseTime+timeOffset)/60) % 24 ) - hour ) * 60
end

RegisterCommand('time', function(source, args, rawCommand)
    if source == 0 then
        if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
            local argh = tonumber(args[1])
            local argm = tonumber(args[2])
            if argh < 24 then
                ShiftToHour(argh)
            else
                ShiftToHour(0)
            end
            if argm < 60 then
                ShiftToMinute(argm)
            else
                ShiftToMinute(0)
            end
            print(lang.timeChange .. argh .. ":" .. argm .. ".")
            TriggerEvent('vSync:requestSync')
        else
            print(lang.errorInvalidSyntax .. lang.syntaxTime)
        end
    elseif source ~= 0 then
        if isAllowedToChange(source) then
            if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
                local argh = tonumber(args[1])
                local argm = tonumber(args[2])
                if argh < 24 then
                    ShiftToHour(argh)
                else
                    ShiftToHour(0)
                end
                if argm < 60 then
                    ShiftToMinute(argm)
                else
                    ShiftToMinute(0)
                end
                local newtime = math.floor(((baseTime+timeOffset)/60)%24) .. ":"
				local minute = math.floor((baseTime+timeOffset)%60)
                if minute < 10 then
                    newtime = newtime .. "0" .. minute
                else
                    newtime = newtime .. minute
                end
                TriggerClientEvent('vSync:notify', source, lang.timeChanged..': ~y~' .. newtime .. "~s~!")
                TriggerEvent('vSync:requestSync')
            else
                TriggerClientEvent('chatMessage', source, '', {255,255,255}, lang.errorInvalidSyntax .. lang.syntaxTime)
            end
        else
            TriggerClientEvent('chatMessage', source, '', {255,255,255}, lang.errorNotAllowed)
            print(lang.errorAcessDenied..'/time')
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local newBaseTime = os.time(os.date("!*t"))/2 + 360
        if freezeTime then
            timeOffset = timeOffset + baseTime - newBaseTime			
        end
        baseTime = newBaseTime
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        TriggerClientEvent('vSync:updateTime', -1, baseTime, timeOffset, freezeTime)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300000)
        TriggerClientEvent('vSync:updateWeather', -1, CurrentWeather, blackout)
    end
end)

Citizen.CreateThread(function()
    while true do
        newWeatherTimer = newWeatherTimer - 1
        Citizen.Wait(60000)
        if newWeatherTimer == 0 then
            if DynamicWeather then
                NextWeatherStage()
            end
            newWeatherTimer = 60
        end
    end
end)

function NextWeatherStage()
    if CurrentWeather == "CLEAR" or CurrentWeather == "CLOUDS" or CurrentWeather == "EXTRASUNNY" then
        if math.random(1,2) == 1 then
            CurrentWeather = "CLEARING"
        else
            CurrentWeather = "OVERCAST"
        end
    elseif CurrentWeather == "CLEARING" or CurrentWeather == "OVERCAST" then
        local new = math.random(1,6)
        if new == 1 then
            if CurrentWeather == "CLEARING" then
                CurrentWeather = "FOGGY"
            else
                CurrentWeather = "CLEAR"
            end
        elseif new == 2 then
            CurrentWeather = "CLOUDS"
        elseif new == 3 then
            CurrentWeather = "CLEAR"
        elseif new == 4 then
            CurrentWeather = "EXTRASUNNY"
        elseif new == 5 then
            CurrentWeather = "SMOG"
        else
            CurrentWeather = "FOGGY"
        end
    elseif CurrentWeather == "CLEAR" or CurrentWeather == "CLEAR" then
        CurrentWeather = "CLEARING"
    elseif CurrentWeather == "SMOG" or CurrentWeather == "FOGGY" then
        CurrentWeather = "CLEAR"
    end
    TriggerEvent("vSync:requestSync")
    TriggerEvent("VRP:Debug", string.format("%s: %s.", lang.consoleGenerated, CurrentWeather), GetCurrentResourceName())
    TriggerEvent("VRP:Debug", string.format("%s %s %s", lang.consoleReset, weatherTimerLimit, lang.consoleMinutes), GetCurrentResourceName())
end
