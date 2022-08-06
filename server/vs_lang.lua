local lang = {
    ["en-US"] = {
        timeFreeze = 'Time is now ~b~frozen~s~.',
        timeUnfreeze = 'Time is ~y~no longer frozen~s~.',
        errorNotAllowed = '^8Error: ^1You are not allowed to use this command.',
        printTimeFreeze = 'Time is now frozen.',
        printTimeUnfreeze = 'Time is no longer frozen.',
        dynamicWeatherEn = 'Dynamic weather changes are now ~b~enabled~s~.',
        dynamicWeatherDs = 'Dynamic weather changes are now ~r~disabled~s~.',
        printWeatherFreeze = 'Weather is now frozen.',
        printWeatherUnfreeze = 'Weather is no longer frozen.',
        invalidSyntax = 'Invalid syntax, correct syntax is: /weather <weathertype>',
        printWeatherUpdate = 'Weather has been updated.',
        invalidWeather = 'Invalid weather type, valid weather types are: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN',
        errorInvalidSyntax = '^8Error: ^1Invalid syntax, use ^0/weather <weatherType> ^1instead!',
        weatherChange = 'Weather will change to',
        errorInvalidWeather = '^8Error: ^1Invalid weather type, valid weather types are: ^0\nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN',
        errorAcessDenied = 'Access for command /weather denied.',

    },
    ["pt-BR"] = {
        timeFreeze = 'Tempo está ~b~congelado~s~.',
        timeUnfreeze = 'Tempo não está mais ~y~congelado~s~.',
        errorNotAllowed = '^8Erro: ^1Sem permissão para usar esse comando.',
        printTimeFreeze = 'Tempo está congelado.',
        printTimeUnfreeze = 'Tempo está descongelado.',
        dynamicWeatherEn = 'Mudanças climáticas dinânimas estão ~b~ativadas~s~.',
        dynamicWeatherDs = 'Mudanças climáticas dinânimas estão ~r~desativadas~s~.',
        printWeatherFreeze = 'Mudanças climáticas dinânimas estão ativadas.',
        printWeatherUnfreeze = 'Mudanças climáticas dinânimas estão desativadas.',
        printWeatherUpdate = 'Clima foi atualizado.',
        invalidSyntax = 'Sintaxe incorreta, o correto é: /weather <weathertype>',
        invalidWeather = 'Tipo de clima inválido, tipos válidos são: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN',
        errorInvalidSyntax = '^8Erro: ^1Sintaxe inválida, use ^0/weather <weatherType> ^1!',
        weatherChange = 'Clima irá mudar para',
        errorInvalidWeather = '^8Erro: ^1Tipo de clima inválido, tipos válidos são: ^0\nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN',
        errorAcessDenied = 'Acesso para o comando /weather negado.',
    }
}

function getLang(language)
    return lang[language]
end
