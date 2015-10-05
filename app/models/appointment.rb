class Appointment < ActiveRecord::Base
	validates :visit_date , :presence => true
	validates :pet_name , :presence => true
	validates :customer_email , :presence => true
	validates :reason_of_visit , :presence => true
	belongs_to :user
	has_many :pet_records
	validate :validate_date?
    def validate_date?
      if visit_date < Date.today
         errors.add(:visit_date, 'Invalid date') 
      end 
    end
end
