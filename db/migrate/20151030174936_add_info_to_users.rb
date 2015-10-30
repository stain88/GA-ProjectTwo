class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :bio, :text
    add_column :users, :profile_pic, :text
  end
end
