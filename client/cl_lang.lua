local lang =  {
    ["en-US"] = {
        sugWeatherDescription = 'Change the weather.',
        sugWeatherHelp = 'Available types: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas & halloween',
        sugTimeDescription = 'Change the time.',
        sugTimeHelp = 'A number between ',
        sugFreezeTimeDescription = 'Freeze/Unfreeze time.',
        sugFreezeWeatherDescription = 'Enable/Disable dynamic weather changes.',
        sugShift = 'Set the time to ',
        sugBlackout = 'Enable/Disable blackout mode.'
    },
    ["pt-BR"] = {
        sugWeatherDescription = 'Muda o clima.',
        sugWeatherHelp = 'Tipos disponíveis: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas & halloween',
        sugTimeDescription = 'Muda o horário.',
        sugTimeHelp = 'Um número entre ',
        sugFreezeTimeDescription = 'Congela/Descongela o horário.',
        sugFreezeWeatherDescription = 'Ativa/Desativa as mudanças climáticas.',
        sugShift = 'Coloca o relógio em ',
        sugBlackout = 'Ativa/Desativa o modo de blackout.'
    }
}

function getLang(language)
    return lang[language]
end
