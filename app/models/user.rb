class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :omniauthable, :encryptable, :token_authenticatable
  devise :database_authenticatable, :registerable, :timeoutable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
