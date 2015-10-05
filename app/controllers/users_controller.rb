class UsersController < ApplicationController
  skip_before_action :validate_session, only: [:new, :create, :login_page ,:allow_login]
  def index
   @user=User.all
  end

  def new
    @user=User.new
  end
  def create
   @user=User.new(user_params)
   if @user.save
     session[:user_id] = @user.id
     redirect_to :action=> "index"
     flash[:notice] = "Successfully Created :)"
   else
     render "new" 
   end
  end
  def edit
    @user=User.find(params[:id])
  end
  def update
    
   @user=User.find(params[:id])
   #@user.update_attributes(user_params)
   @user.update_columns(user_params)
   if @user
     redirect_to :action=> "index"
     flash[:notice] = "Successfully Updated :)"
   else
     render "new"
   end
  
end
  def show
   @user=User.find(params[:id])
  end
  def destroy
    @user=User.find(params[:id])
    @user.delete
    redirect_to :action=> "index"
  end
  def login_page
    @user= User.new
  end
  def allow_login
    @user = User.authenticate(params[:user][:email], params[:user][:password])
    if @user and (@user.position == "Head" or @user.position == "Helper")
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      elsif @user and @user.position == "receptionist"
        session[:user_id] = @user.id
        redirect_to :controller=>"appointments", :action => "new"
         elsif @user and @user.position.blank?
        session[:user_id] = @user.id
        redirect_to :controller=>"pet_records", :action => "index"
    else
       redirect_to  root_path
    end
  end
 
  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
  private 
  def user_params
    params.require(:user).permit!
  end
end
