class AppointmentsController < ApplicationController
  def index
    if current_user.position == "receptionist"
      @appointment= Appointment.all 
    else 
  	  @appointment= Appointment.where(:user_id=>current_user.id)
    end
  end

  def new
  	@appointment= Appointment.new
  end
  def create
    byebug
     @appointment= Appointment.new(appointment_params)
     if @appointment.save
        redirect_to :action=>"index"
    else
    	render "new"
     end
  end
private
  def appointment_params
     params.require(:appointment).permit!	 
  end

end
