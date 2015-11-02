class ChangeKongLinkToExternalLink < ActiveRecord::Migration
  def change
    rename_column :games, :kong_link, :external_link
  end
end
