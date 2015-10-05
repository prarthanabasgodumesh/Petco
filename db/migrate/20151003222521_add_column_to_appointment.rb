class AddColumnToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :customer_email, :string
    add_column :appointments, :user_id, :integer
  end
end
