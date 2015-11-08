class AddWinnerToJams < ActiveRecord::Migration
  def change
    add_column :jams, :winner, :integer
  end
end
