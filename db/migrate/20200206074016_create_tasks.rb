class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.date       :day,           null: false
      t.integer    :beforetime_id
      t.integer    :aftertime_id
      t.string     :place
      t.string     :doing,         null: false
      t.string     :memo
      t.references :user,    foreign_key: true
      t.timestamps
    end
  end
end
