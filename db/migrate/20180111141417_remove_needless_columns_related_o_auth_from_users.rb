class RemoveNeedlessColumnsRelatedOAuthFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :identifier
    remove_column :users, :access_token
  end
end
