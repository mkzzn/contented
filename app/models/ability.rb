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
      can_view_published_article
      can_manage_self
      can :create, Comment
      can_delete_own_comment
    end
  end

  def can_view_rough_drafts
    can [:view], Article, :role => "admin"
  end

  def can_view_published_article
    can [:view], Article, :published => true
  end

  def can_manage_self
    can [:manage], User, ["id = ?", @user.id] do |current_user|
      current_user.id == @user.id
    end
  end

  def can_delete_own_comment
    can [:delete], Comment do |comment|
      comment.user_id == @user.id and not comment.user_id.nil?
    end
  end
end
