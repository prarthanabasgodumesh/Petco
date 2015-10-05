class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :confirm_password
      t.string :contact_no

      t.timestamps null: false
    end
  end
end
