local commands = require "src.commands"

command = arg[1]

handler = commands[command]

if not handler then
    print("Uso:")
    print(" add <descrição da tarefa>: Adiciona uma tarefa")
    print(" remove <id da tarefa>: Remove uma tarefa")
    print(" toggle <id da tarefa>: Alterna a tarefa entre o estado pendente e concluído.")
    print(" list: Mostra todas as tarefas")
end