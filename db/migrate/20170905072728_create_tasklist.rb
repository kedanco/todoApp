class CreateTasklist < ActiveRecord::Migration[5.1]
  def change
    create_table :tasklists do |t|

      t.string      :name
      t.string      :description
      t.datetime    :duedate
      t.string      :status


      t.timestamps

    end
  end
end
