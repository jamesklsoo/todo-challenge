# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'
# require 'byebug'

# Your Code begins from this line onwards #
class Todo

  def to_s
    puts "#{@description}::: #{@status}"
  end

end

if __FILE__ == $0

  case ARGV[0]
  when 'list', 'ls'
    Task.list

  when 'find', 'f'
    puts "Insert the id you are looking for: "
    x = $stdin.gets.chomp.to_i
    p Task.finder(x)

  when 'add', 'a'
    puts "Insert your description: "
    y = $stdin.gets.chomp.to_s
    puts "Insert your status: "
    z = $stdin.gets.chomp.to_s
    p Task.add(y,z)
    puts "New task has been added."

  when 'delete', 'd', 'del'
    puts "Insert the id you want to delete: "
    b = $stdin.gets.chomp.to_i
    Task.remove(b)
    puts "Task has been deleted."


  when 'update', 'u'
    puts "Insert the id you want to update: "
    c = $stdin.gets.chomp.to_i
    p Todo.finder(c)
    puts "Update the description."
    m = $stdin.gets.chomp.to_s
    puts "Update the status"
    n = $stdin.gets.chomp.to_s
    puts "Task has been updated."

    Task.edit(c,m,n)

  else
    puts "\ntask [options] \n\n"
    puts "Commands:"
    puts "  (list)    Lists all tasks available"
    puts "  (add)     To add a new task"
    puts "  (delete)  To remove a task"
    puts "  (find)    To find a task"
    puts "  (update)  To update the task"

  end
end

#DRIVER CODE
#  p Todo.add("rap a song, undone")
# Todo.list
