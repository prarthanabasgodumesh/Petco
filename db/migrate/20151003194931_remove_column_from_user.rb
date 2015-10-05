class RemoveColumnFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :contact_no, :string
  end
end
