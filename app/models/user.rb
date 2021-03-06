class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :omniauthable, :encryptable
  devise :database_authenticatable, :registerable, :timeoutable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :role, :display_name,
    :password, :password_confirmation, :remember_me

  has_many :articles

  scope :with_published_articles, lambda {
    where("id in (select DISTINCT user_id from articles where published = ?)", true)
  }

  extend FriendlyId
  friendly_id :full_name, :use => :slugged

  def full_name
    "#{first_name} #{last_name}"
  end

  ROLES = %w[ reader admin ]
end
