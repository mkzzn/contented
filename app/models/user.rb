class User < ActiveRecord::Base
  acts_as_authentic
  
  def confirm!
    raise "user is already confirmed" if confirmed
    update_attributes :confirmed => true
  end
end
