class ChangeOwnersToUsers < ActiveRecord::Migration
  def change
    rename_table 'owners', 'users'
    rename_column 'restaurants', 'owner_id', 'user_id'
  end
end
