module Spree
  Admin::ProductsController.class_eval do

    before_action :update_stock_location, only: :create

    def update_stock_location
      Rails.logger.debug "\n update_stock_location \n"
      Rails.logger.debug "\n try_spree_current_user.stock_location_ids= #{try_spree_current_user.stock_location_ids} \n"
      @product.master.stock_location_ids = [try_spree_current_user.stock_location_id]
      @product.price = params["product"]["price"]
      Rails.logger.debug "Product is #{@product.inspect}"
      Rails.logger.debug "Product is valid? #{@product.valid?}"
    end

  end
end
