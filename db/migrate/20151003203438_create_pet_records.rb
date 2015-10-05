class CreatePetRecords < ActiveRecord::Migration
  def change
    create_table :pet_records do |t|
      t.string :pet_name
      t.string :type_of_pet
      t.string :breed
      t.string :age
      t.string :weight
      t.string :date_0f_last_visit

      t.timestamps null: false
    end
  end
end
