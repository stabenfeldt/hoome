module Spree
  Admin::ProductsController.class_eval do

    before_action :update_stock_location, only: :create

    def update_stock_location
      @product.master.stock_location_ids = [try_spree_current_user.stock_location_id]
    end

  end
end
