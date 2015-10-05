class PetRecord < ActiveRecord::Base
    validates :visit_date, :presence => true, :length=> {:maximum=>35}
    validates :breed, :presence => true, :length=> {:maximum=>35}
    validates :age , :presence=> true
    validates :weight, :presence=> true
    validates :date_0f_last_visit, :presence=> true

	belongs_to :appointment
end
