class Task < ActiveRecord::Base
  def self.list
    task = Task.all
    print "No".ljust(5) + "Description".ljust(20) + "Status".ljust(10)
    puts ""
    print "--".ljust(5) + "-----------".ljust(20) + "------".ljust(10)
    puts ""
    Task.all.each_with_index do |tasks, index|
      puts "#{index+1}".ljust(5) + "#{tasks.description}".ljust(20) + "#{tasks.status}".ljust(10)
    end
  end

  def self.finder(id)
    task = Task.find_by(:id => id)
  end

  def self.add(description, status)
    task = Task.create(description: description, :status => status)
  end

  def self.remove(id)
    task_id = Task.all[id-1].id
    Task.destroy(task_id)
  end

  def self.edit(id, description, status)
    task = Task.find_by(:id => id)
    task.update(description: description, status: status)
    puts "Task has been updated."
  end
end
