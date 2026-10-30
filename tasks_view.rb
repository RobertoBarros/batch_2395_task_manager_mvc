class TasksView

  def ask_description
    puts "Enter task description"
    gets.chomp
  end

  def ask_index
    puts "Enter task index"
    gets.chomp.to_i - 1
  end

  def display(tasks)
    tasks.each_with_index do |task, index|
      check = task.done? ? "[X]" : "[ ]"
      puts "#{index + 1} - #{check} #{task.description}"
    end
  end

end
