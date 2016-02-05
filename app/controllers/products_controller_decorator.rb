module Spree
  Admin::ProductsController.class_eval do

    before_action :update_stock_location, only: :create

    def update_stock_location
      Rails.logger.debug "\n update_stock_location \n"
      @product.master.stock_location_ids = [try_spree_current_user.stock_location_id]
      Rails.logger.debug "Product is #{@product.inspect}"
      Rails.logger.debug "Product is valid? #{@product.valid?}"
    end

  end
end
