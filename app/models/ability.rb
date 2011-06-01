class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
    when "owner", "editor", "author"
      can :manage, :all
    when "reader"
      can :read, :all
    end
  end
end
