# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'
# require 'byebug'

# Your Code begins from this line onwards #
class Todo < ActiveRecord::Base

  # To do list model
  def initialize
    @id = id
    @description = description
    @status = status
  end

  def to_s
    puts "#{@description}::: #{@status}"
  end

  def self.list
    Task.all
  end

  def self.finder(id)
    task = Task.find_by(:id => id)
  end

  def self.add(description, status)
    task = Task.create(description: description, :id => id)
  end

  def self.delete(id)
    task = Task.delete(:id => id)
  end

  def self.edit(id, description, status)
    task = Task.find_by(:id => id)
    task.update(description: description, status: status)
    puts "Task has been updated."
  end

end

if __FILE__ == $0

  case ARGV[0]
  when 'list', 'ls'
    Todo.list

  when 'find', 'f'
    puts "Insert the id you are looking for: "
    x = $stdin.gets.chomp.to_i
    p Todo.finder(x)

  when 'add', 'a'
    puts "Insert your description: "
    y = $stdin.gets.chomp.to_s
    puts "Insert your status: "
    z = $stdin.gets.chomp.to_s
    p Todo.add(y,z)
    puts "New task has been added."



  when 'delete', 'd', 'del'
    puts "Insert the id you want to delete: "
    b = $stdin.gets.chomp.to_i
    Task.delete(b)
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

    Todo.edit(c,m,n)

  else
    puts "\ntodo [options] \n\n"
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
