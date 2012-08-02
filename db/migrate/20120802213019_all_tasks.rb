class AllTasks < ActiveRecord::Migration
  def up
    create_table :all_tasks do |t|
      t.string :task
    end
  end

  def down
    drop_table :all_tasks
  end
end
