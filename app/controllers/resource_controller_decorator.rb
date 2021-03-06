module Spree
  Admin::ResourceController.class_eval do

    # Set available_on to Date.today when creating new Products.
    def new
      invoke_callbacks(:new_action, :before)
      @object.available_on = Date.today if @object.class == Spree::Product

      respond_with(@object) do |format|
        format.html { render :layout => !request.xhr? }
        if request.xhr?
          format.js   { render :layout => false }
        end
      end
    end

    # Overridden because I couldn't get the CanCan permissions correct and load it by accessible_by.
    def load_product
      #@product = Product.accessible_by(current_ability, :read).friendly.find(params[:product_slug]) if params[:product_slug]
      @product = Product.where(slug: params[:product_slug]).first if params[:product_slug]
    end

    # Load all products if admin or load all products belongs_to user.
    def collection
      return parent.send(controller_name) if parent_data.present?
      if model_class.respond_to?(:accessible_by) && !current_ability.has_block?(params[:action], model_class)
        #model_class.accessible_by(current_ability, action)
        if model_class == Spree::Product
          if try_spree_current_user.admin?
            Spree::Product.all
          else
            Spree::Product.items_belonging_to_user(try_spree_current_user)
          end
        else
          model_class.all
        end
      else
        model_class.where(nil)
      end
    end
  end

end
