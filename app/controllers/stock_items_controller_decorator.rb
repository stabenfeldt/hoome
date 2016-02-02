module Spree
  Admin::StockItemsController.class_eval do

    # Overridden because I couldn't get the CanCan permissions correct and load it by accessible_by.
    def load_product
      #@product = Product.accessible_by(current_ability, :read).friendly.find(params[:product_slug]) if params[:product_slug]
      @product = Product.where(slug: params[:product_slug]).first if params[:product_slug]
    end

  end
end
