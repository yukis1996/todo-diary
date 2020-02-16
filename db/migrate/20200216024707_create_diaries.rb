class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string :title, null: false
      t.text :impression, null: false
      t.integer :status, default: 1, null: false, limit: 1
      t.timestamps
    end
  end
end
