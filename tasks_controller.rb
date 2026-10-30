class TasksController
  def initialize(repository)
    @repository = repository
    @view = TasksView.new
  end

  def list
    # 1. Recuperar todas as tasks do repository
    tasks = @repository.all
    # 2. Enviar as tasks para a view mostrar
    @view.display(tasks)
  end

  def add
    # 1. Perguntar a descrição da task
    description = @view.ask_description
    # 2. Criar uma instância da task
    new_task = Task.new(description)
    # 3. Enviar a instância da task para o repository
    @repository.create(new_task)
  end

  def mark_as_done
    # 1. Listar todas tasks
    list
    # 2. Perguntar qual o index da task marcar como done
    index = @view.ask_index
    # 3. Recuperar a task informada
    task = @repository.find(index)
    # 4. Marcar a task como done
    task.mark_as_done!
  end

  def remove
    # 1. Listar todas as tasks
    list
    # 2. Perguntar qual o index da task para excluir
    index = @view.ask_index
    # 3. Mandar o repository destruir a task pelo index
    @repository.destroy(index)
  end
end
