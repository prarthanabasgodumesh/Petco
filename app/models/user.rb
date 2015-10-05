class User < ActiveRecord::Base

   #to validate the fields
   validates :name, :presence => true, :length=> {:maximum=>35}
   validates :email, :presence => true, :uniqueness => true
   validates :password, :presence => true, :length => {:maximum  => 8, :minimum=> 4}
   validates :zip, :presence => true, :length=> {:minimum=>5}
   validates :total_practice, :presence => true, :length=> {:minimum=>1, :maximum=>100}
   has_many :pet_records
   has_many :appointments
   # use this code to encrypt the code
   before_create do |user|
      self.password =   Digest::MD5.hexdigest(password)
      self.confirm_password =   Digest::MD5.hexdigest(confirm_password)
   end

   after_validation do |user|
     if %w(abuse1 abuse2 abuse3 abuse).include?(name)
         self.name = "Unknown"
     end
   end
  
   def self.authenticate(email, password)
     @user=User.where(:email=> email, :password=>Digest::MD5.hexdigest(password))
     if !@user.blank?
       @user.first
     else
      nil
     end
   end
end
