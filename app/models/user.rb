class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, 
    :remember_me, :available, :about, :looking_for, :city,
    :state, :company_name, :talent_type

  validates_presence_of :about, if: :available
  validates_presence_of :looking_for, if: :available
  validates_presence_of :city, if: :available
  validates_presence_of :talent_type, if: :available

end
