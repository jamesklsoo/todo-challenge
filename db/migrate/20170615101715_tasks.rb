require_relative 'config/application'

class Tasks < ActiveRecord::Migration[4.2]
  def change

    create_table :tasks do |t|
      t.string :description
      t.string :status
      t.timestamps
    end
  end
end
