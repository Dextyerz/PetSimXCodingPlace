function HatchEgg(Pet)
    local state = ''
    if string.find(Pet, 'Golden') then 
        state = 'gold'
        Pet = string.gsub(Pet, 'Golden ', '')
    elseif string.find(Pet, 'Rainbow') then 
        state = 'rainbow'
        Pet = string.gsub(Pet, 'Rainbow ', '')
    elseif string.find(Pet, 'Dark Matter') then
        state = 'darkmatter'
        Pet = string.gsub(Pet, 'Dark Matter ', '')
    else 
        state = 'normal'
    end
    local pet = Pet
    for i,v in pairs(game.ReplicatedStorage.Game.Pets:GetChildren()) do
        if string.split(tostring(v), ' - ')[2] == pet then
            pet = string.split(tostring(v), ' - ')[1]
        end
    end
    local tbl = {
        {
        nk = 'Preston',
        idt = '69',
        e = false,
        uid = '69',
        s = 999999999999,
        id = pet,
    }}
    local g_tbl = {
        {
        nk = 'Preston',
        idt = '69',
        e = false,
        g = true,
        uid = '69',
        s = 999999999999,
        id = pet,
    }} 
    local r_tbl = {
        {
        nk = 'Preston',
        idt = '69',
        e = false,
        r = true,
        uid = '69',
        s = 999999999999,
        id = pet,
    }}
    local dm_tbl = {
        {
        nk = 'Preston',
        idt = '69',
        e = false,
        dm = true,
        uid = '69',
        s = 999999999999,
        id = pet,
    }} 
    local egg
    for i_,script in pairs(game.ReplicatedStorage.Game.Eggs:GetDescendants()) do
        if script:IsA('ModuleScript') then
            if typeof(require(script).drops) == 'table' then
                for i,v in pairs(require(script).drops) do
                    if v[1] == pet then
                        egg = require(script).displayName
                    end
                end
            end
        end
    end
    if Pet == 'Huge Pegasus' then egg = 'Cracked Egg' 
    elseif Pet == 'Huge Cat' then egg = 'Cracked Egg' end
    for i,v in pairs(getgc(true)) do
        if (typeof(v) == 'table' and rawget(v, 'OpenEgg')) then
            if state == 'normal' then
                v.OpenEgg(egg, tbl)
            else 
                if state == 'gold' then 
                    v.OpenEgg(egg, g_tbl)
                elseif state == 'rainbow' then 
                    v.OpenEgg(egg, r_tbl) 
                elseif state == 'darkmatter' then 
                    v.OpenEgg(egg, dm_tbl)
                end 
            end 
        end
    end
end

HatchEgg('Huge Cat', 'Rainbow')
