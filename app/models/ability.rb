class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
    when "owner", "editor", "author"
      can :manage, :all
      can :approve, Coffeeshop
    when "reader"
      can [:read, :submit], Coffeeshop
    end
  end
end
