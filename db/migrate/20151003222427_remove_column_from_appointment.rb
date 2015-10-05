class RemoveColumnFromAppointment < ActiveRecord::Migration
  def change
    remove_column :appointments, :user_email, :string
  end
end
