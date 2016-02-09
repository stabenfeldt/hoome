module Spree
  class MultiVendorAbility
    include CanCan::Ability

    def initialize(user)
      user ||= Spree::User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
        puts "IS admin"
      else
        can :read, :all
        puts "NOT admin"
      end

      if user.stock_locations.present?
        can  :manage, Spree::StockItem, :stock_location_id => user.stock_locations.first.id
      end
    end

  end
end

