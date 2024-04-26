local json = require "src.lib.json"
local db = require "src.db"

local M = {}

function M.add()
    local name = table.concat({table.unpack(arg, 2)}, " ")

    while string.len(name) == 0 do
        io.write("Digite um nome: ")
        name = io.read()
    end

    db.add_task(name)

    M.list()
end

function M.remove()
    local id = arg[2]

    if not id then
        return print("Sintaxe: remove <id-da-tarefa>")
    end

    result = db.remove_task(tonumber(id))

    if not result then
        print("Tarefa não encontrada.")
    end

    M.list()
end

function M.list()
    data = db.read_db()

    for _, task in ipairs(data) do
        if task.status == "concluido" then
            io.write("✅ ")
        else
            io.write("🔲 ")
        end

        print(task.name)
    end
end

function M.toggle()
    local id = arg[2]

    if not id then
        return print("Sintaxe: toggle <id-da-tarefa>")
    end

    result = db.toggle_task(tonumber(id))

    if not result then
        print("Tarefa não encontrada.")
    end

    M.list()
end

return M