class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, :all
    can :create, User

    unless user.nil?
        can :update, Visit, { user_id: user.id}
        can :create, Visit, { user_id: user.id}
        can :destroy, Visit, { user_id: user.id}
        can :update, User, { user_id: user.id}
        can :destroy, User, { user_id: user.id}
        can :update, City
        can :update, Country
        can :destroy, City, :visits => nil
        can :destroy, Country, :cities => nil
        can :create, City
        can :create, Country
    end





    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
