TRIGSTR = compiletime(function()
    function ceres.info()
        print('layout:')
        print('mapsDirectory:', ceres.layout.mapsDirectory)
        print('srcDirectories:', ceres.layout.srcDirectories)
        for key, value in pairs(ceres.layout.srcDirectories) do
            print(key, value)
        end
        print('targetDirectory:', ceres.layout.targetDirectory)
        print('mapScript:', ceres.layout.mapScript)
        print()
        print('runConfig:')
        print('command:', ceres.runConfig.command)
        print('prefix:', ceres.runConfig.prefix)
        print('args:', ceres.runConfig.args)
        for key, value in pairs(ceres.runConfig.args) do
            print(key, value)
        end
        local args = ceres.getScriptArgs()
        -- print(args)
        for key, value in pairs(args) do
            print(key, value)
        end
    end
    local path = './' .. currentMap.path .. 'war3map.wts'
    local file = io.open(path, 'r+')
    local isAdd = false
    TRIGSTR = {}
    for line in file:lines() do
        if  isAdd then
            table.insert(TRIGSTR, line)
        end
        isAdd = line == '{'
    end
    return TRIGSTR
end)
MAP_NAME = compiletime(function()
    MAP_NAME = TRIGSTR[1]
    return MAP_NAME
end)