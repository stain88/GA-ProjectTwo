class AddStatusToJams < ActiveRecord::Migration
  def change
    add_column :jams, :status, :string
  end
end
