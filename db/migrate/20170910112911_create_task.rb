class CreateTask < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|

      t.string   :name
      t.integer  :tasklist_id
      t.string   :description
      t.datetime :duedate
      t.string   :status
      t.string   :priority

      t.timestamps

    end
  end
end
