class Ability
  include CanCan::Ability

  BANNED = -20
  MEMBER = -20

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    can :authenticate, :all if !user.new_record?

    # Vote
    can :create, Vote do |vote|
      if vote.voteable_type == "Report::Version"
        !user.new_record? && user.whistlr_reputation > MEMBER
      else
        !user.new_record? && user.archivist_reputation > MEMBER
      end
    end

    # Response
    can :create, Report::Response do |response|
      !user.new_record? && response.report.approved?
    end

    # Reports
    can :create, Report do |report|
      !user.new_record? && user.whistlr_reputation > BANNED
    end
    can :update, Report do |report|
      !user.new_record? && user.whistlr_reputation > BANNED
    end

    # Uploads
    can :create, Upload do |upload|
      !user.new_record? && user.archivist_reputation > BANNED
    end

    # Organizations
    can :create, Organization do |organization|
      !user.new_record? && user.archivist_reputation > BANNED
    end
    can :update, Organization do |organization|
      !user.new_record? && user.archivist_reputation > BANNED
    end

    # Policies
    can :create, Policy do |policy|
      !user.new_record? && user.archivist_reputation > BANNED
    end
    can :update, Policy do |policy|
      !user.new_record? && user.archivist_reputation > BANNED
    end

    # Products
    can :create, Product do |product|
      !user.new_record? && user.archivist_reputation > BANNED
    end
    can :update, Product do |product|
      !user.new_record? && user.archivist_reputation > BANNED
    end

    # Officials
    can :create, Official do |official|
      !user.new_record? && user.archivist_reputation > BANNED
    end
    can :update, Official do |official|
      !user.new_record? && user.archivist_reputation > BANNED
    end

    # Users
    can :update, User do |edited_user|
      edited_user.id == user.id
    end
    can :create, User do |new_user|
      user.new_record?
    end
  end
end
