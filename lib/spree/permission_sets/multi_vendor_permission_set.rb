module Spree
  module PermissionSets
    # A user should only have access to items belonging to the
    # stock locations he belongs to. He should only see activity
    # belonging to his items.  E.g. Stock managment and orders
    #
    # Users can be associated with stock locations via the admin user interface.
    #
    # OBS: As things are today, a user can only be assosiated with one stock location.
    #
    # @see Spree::PermissionSets::Base
    #
    # https://github.com/CanCanCommunity/cancancan/wiki/defining-abilities

    class MultiVendor < PermissionSets::Base

      def activate!
        Rails.logger.debug  "in MultiVendor activate!"

        #can  :manage, Spree::StockItem
        #can  :manage, Spree::StockItem, :stock_location_id => user.stock_locations.present? && user.stock_locations.first.id
        #can :create, StockItem
        #can :all, Spree::OptionValuesVariant
        #can :all, Spree::StockLocation

        can :manage, Spree::StockLocation do |location|
          user.admin? || user.stock_locations.include?(location)
        end

        can [:index, :create, :view, :read], Spree::Product
        can [:display, :admin, :edit, :list, :update], Spree::Product do |product|
          product.master.stock_locations.blank? ||
          product.master.stock_locations.first.id == user.stock_locations.first.id
        end


        can [:manage], Spree::Image

      end
    end
  end
end

