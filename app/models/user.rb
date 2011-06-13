class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :omniauthable, :encryptable
  devise :database_authenticatable, :registerable, :timeoutable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def update_with_password(attrs)
    update_attributes sanitize_password_attrs(attrs)
  end

  private

  def sanitize_password_attrs(attrs)
    password_attrs_empty?(attrs) ? delete_password_attrs(attrs) : attrs
  end

  def delete_password_attrs(attrs)
    attrs.delete_if {|key, value| ["password", "password_confirmation"].include?(key) }
    attrs
  end

  def password_attrs_empty?(attrs)
    attrs["password"].empty? and attrs["password_confirmation"].empty?
  end
end
