class AddDeletionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :deleted_at, :datetime, default: nil
  end
end
