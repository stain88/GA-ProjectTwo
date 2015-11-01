class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.integer :height
      t.integer :width
      t.text :url
      t.references :user, index: true, foreign_key: true
      t.references :jam, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
