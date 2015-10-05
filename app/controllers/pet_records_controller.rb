class PetRecordsController < ApplicationController
  def index
     @appointment=Appointment.find_by_customer_email current_user.email
     @pet_record=PetRecord.where(:appointment_id=> @appointment.id)
  end
  def new
  	@pet_record=PetRecord.new
  end
  def create
    
  	@pet_record=PetRecord.new(pet_record_params.merge!(:user_id=>current_user.id))
  	if @pet_record.save
       @pet_records.update_columns(:appointment_id=> params["appointmen_id"])
       redirect_to appointments_path
    else
        render "new"	 
  	end
  end
  private
  def pet_record_params
    params.require(:pet_record).permit!
  end
end
