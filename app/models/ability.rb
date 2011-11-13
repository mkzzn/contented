class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    set_abilities_by_role
  end

  def set_abilities_by_role
    case @user.role
    when "admin"
      can :manage, :all
    when "reader"
      can_manage_self
      can :create, Comment
    end
  end

  def can_manage_self
    can [:manage], User, ["id = ?", @user.id] do |current_user|
      current_user.id == @user.id
    end
  end
end
