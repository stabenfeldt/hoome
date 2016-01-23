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
        #cannot :manage, :all

        #cannot :all, Spree::StockItem
        can    :view, Spree::StockItem, :stock_location_id => user.stock_locations.present? && user.stock_locations.first.id

        #cannot :all, Spree::Product
        can [:index, :create, :view], Spree::Product

        can [:display, :admin, :edit, :list, :update], Spree::Product do |product|
          product.master.stock_locations.blank? ||
          product.master.stock_locations.first.id == user.stock_locations.first.id
        end

        can :all, Spree.user_class
        can :all, Spree::Product

        can [:manage], Spree::Image


        # p.master.stock_locations.first.id
            #Spree::Image
            #Spree::Variant
            #Spree::OptionValue
            #Spree::ProductProperty
            #Spree::OptionType
            #Spree::Property
            #Spree::Prototype
            #Spree::Taxonomy
            #Spree::Taxon

        #can [:display, :admin], Spree::Image
        #can [:display, :admin], Spree::Variant
        #can [:display, :admin], Spree::OptionValue
        #can [:display, :admin], Spree::ProductProperty
        # can [:display, :admin, :create], Spree::OptionType
        #can [:display, :admin], Spree::Property
        #can [:display, :admin], Spree::Prototype
        #can [:display, :admin], Spree::Taxonomy
        #can [:display, :admin], Spree::Taxon
      end

    end
  end
end
