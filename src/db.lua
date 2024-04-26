local json = require "src.lib.json"
local M = {}

function M.write_db(db)
    local file = io.open("db.json", "w")

    file:write(json.encode(db))

    file:close()
end

function M.read_db()
    local file = io.open("db.json", "r")
    
    if not file then
        return {}
    end

    local content = file:read("*a")
    file:close()

    return json.decode(content)
end

function M.add_task(name)
    local db = M.read_db()

    table.insert(db, {
        id = #db + 1,
        name = name,
        status = "pendente"
    })

    M.write_db(db)
end

function M.remove_task(id)
    local db = M.read_db()

    for index, task in ipairs(db) do
        if task.id == id then
            table.remove(db, index)
            M.write_db(db)
            return true
        end
    end

    return false
end

function M.toggle_task(id)
    local db = M.read_db()

    for index, task in ipairs(db) do
        if task.id == id then
            db[index].status = db[index].status == "pendente" and "concluido" or "pendente"
            M.write_db(db)
            return true
        end
    end

    return false
end

return M