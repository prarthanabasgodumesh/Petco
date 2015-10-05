class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :visit_date
      t.string :pet_name
      t.string :user_email
      t.date :reminder_date
      t.string :reason_of_visit

      t.timestamps null: false
    end
  end
end
