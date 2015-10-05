class AddColumnToPetRecord < ActiveRecord::Migration
  def change
    add_reference :pet_records, :appointment, index: true, foreign_key: true
  end
end
