local lang = {
    ["en-US"] = {
        errorNotAllowed = '^8Error: ^1You are not allowed to use this command.',
        errorInvalidSyntax = '^8Error: ^1Invalid syntax, use ',
        errorAcessDenied = 'Access denied for command ',

        printFreeze = ' is now frozen.',
        printUnfreeze = ' is no longer frozen.',

        errorInvalidWeather = '^8Error: ^1Invalid weather type, valid weather types are: ^0\nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN',
        printWeather = 'Weather',
        syntaxWeather = '^0/weather <weatherType>^1',
        dynamicWeatherEn = 'Dynamic weather changes are now ~b~enabled~s~.',
        dynamicWeatherDs = 'Dynamic weather changes are now ~r~disabled~s~.',
        printWeatherUpdate = 'Weather has been updated.',
        weatherChange = 'Weather will change to',
        
        printBlackoutEn = 'Blackout is now enabled.',
        printBlackoutDs = 'Blackout is now disabled.',
        blackoutEn = 'Blackout is now ~b~enabled~s~.',
        blackoutDs = 'Blackout is now ~b~disabled~s~.',

        errorTimeConsole = 'For console, use the "/time <hh> <mm>" command instead!',
        printTime = 'Time',
        syntaxTime = '^0/time <hour> <minute>^1',
        timeFreeze = 'Time is now ~b~frozen~s~.',
        timeUnfreeze = 'Time is ~y~no longer frozen~s~.',
        timeSet = 'Time set to',
        timeMorning = 'morning',
        timeNoon = 'noon',
        timeEvening = 'evening',
        timeNight = 'night',
        timeChange = 'Time has changed to',
        timeChanged = 'Time was changed to',
        
        consoleGenerated = 'New random weather type has been generated',
        consoleReset = 'Resetting timer to',
        consoleMinutes = 'minutes.'
    },
    ["pt-BR"] = {
        errorNotAllowed = '^8Erro: ^1Sem permissão para usar esse comando.',
        errorInvalidSyntax = '^8Erro: ^1Sintaxe inválida, use ',
        errorAcessDenied = 'Acesso para o comando /weather negado.',

        printFreeze = ' está congelado.',
        printUnfreeze = ' não está mais congelado.',

        errorInvalidWeather = '^8Erro: ^1Tipo de clima inválido, tipos válidos são: ^0\nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN',
        printWeather = 'Clima',
        syntaxWeather = '^0/weather <tipoClima>^1',
        dynamicWeatherEn = 'Mudanças climáticas dinânimas estão ~b~ativadas~s~.',
        dynamicWeatherDs = 'Mudanças climáticas dinânimas estão ~r~desativadas~s~.',
        printWeatherUpdate = 'Clima foi atualizado.',
        weatherChange = 'Clima irá mudar para',

        printBlackoutEn = 'Blackout está ativado.',
        printBlackoutDs = 'Blackout está desativado.',
        blackoutEn = 'Blackout está ~b~ativado~s~.',
        blackoutDs = 'Blackout está ~b~desativado~s~.',

        errorTimeConsole = 'Para o console, use o comando "/time <hh> <mm>"!',
        printTime = 'Tempo',
        syntaxTime = '^0/time <hora> <minuto>^1',
        timeFreeze = 'Tempo está ~b~congelado~s~.',
        timeUnfreeze = 'Tempo não está mais ~y~congelado~s~.',
        timeSet = 'Tempo ajustado para',
        timeMorning = 'manhã',
        timeNoon = 'tarde',
        timeEvening = 'anoitecer',
        timeNight = 'noite',
        timeChange = 'Tempo mudado para',
        timeChanged = 'Tempo foi mudado para',

        consoleGenerated = 'Novo clima randômico foi gerado',
        consoleReset = 'Resetando tempo para',
        consoleMinutes = 'minutos.'
    }
}

function getLang(language)
    return lang[language]
end
