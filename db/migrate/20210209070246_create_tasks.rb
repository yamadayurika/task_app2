class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :startdate
      t.date :finishdate
      t.boolean :allday
      t.text :memo

      t.timestamps
    end
  end
end
