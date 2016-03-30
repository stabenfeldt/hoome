#rubocop:disable all

module Spree
  class MultiVendorAbility
    include CanCan::Ability

    def initialize(user)
      user ||= Spree::User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
        puts 'IS admin'
      elsif user.vendor?
        # Can not
        cannot :admin, Spree.user_class
        cannot :admin, Spree::OptionType
        cannot :admin, Spree::Property
        cannot :admin, Spree::Taxonomy
        cannot [:fire, :resend], Spree::Order
        cannot [:update], Spree::Shipment
        #cannot :admin, Spree::Prototype

        # Is allowed to
        # TODO: Make sure one can't update other users products.
        can :update, Spree::Product
      end

      if user.stock_locations.present?
        can  :manage, Spree::StockItem, :stock_location_id => user.stock_locations.first.id
      end
    end

  end
end

