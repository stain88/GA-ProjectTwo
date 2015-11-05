class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
        can :access, :rails_admin
        can :dashboard
        can :manage, :all
    elsif user.moderator?
        can :manage, Jam
        can :manage, Game
        can :read, :all
    else
        can :read, :all
        can :update, Game, :user_id => user.id
    end
  end
end
