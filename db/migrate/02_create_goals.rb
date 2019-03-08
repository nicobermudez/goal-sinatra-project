class CreateGoals < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :title
      t.string :description
      t.string :action_plan
      t.date :deadline
      t.string :completed
    end
  end
end
