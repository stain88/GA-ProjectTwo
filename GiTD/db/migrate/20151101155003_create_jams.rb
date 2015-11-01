class CreateJams < ActiveRecord::Migration
  def change
    create_table :jams do |t|
      t.integer :title
      t.string :theme
      t.string :mechanic

      t.timestamps null: false
    end
  end
end
