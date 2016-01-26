module Spree
  Admin::OrdersController.class_eval do

      def index
        query_present = params[:q]
        params[:q] ||= {}
        params[:q][:completed_at_not_null] ||= '1' if Spree::Config[:show_only_complete_orders_by_default]
        @show_only_completed = params[:q][:completed_at_not_null] == '1'
        params[:q][:s] ||= @show_only_completed ? 'completed_at desc' : 'created_at desc'

        # As date params are deleted if @show_only_completed, store
        # the original date so we can restore them into the params
        # after the search
        created_at_gt = params[:q][:created_at_gt]
        created_at_lt = params[:q][:created_at_lt]

        params[:q].delete(:inventory_units_shipment_id_null) if params[:q][:inventory_units_shipment_id_null] == "0"

        if params[:q][:created_at_gt].present?
          params[:q][:created_at_gt] = Time.zone.parse(params[:q][:created_at_gt]).beginning_of_day rescue ""
        end

        if params[:q][:created_at_lt].present?
          params[:q][:created_at_lt] = Time.zone.parse(params[:q][:created_at_lt]).end_of_day rescue ""
        end

        if @show_only_completed
          params[:q][:completed_at_gt] = params[:q].delete(:created_at_gt)
          params[:q][:completed_at_lt] = params[:q].delete(:created_at_lt)
        end

        # FIXME Only load orders belonging to @current_user
        # o.select { |i| mine.include?(i) }
        @search = Order.accessible_by(current_ability, :index).ransack(params[:q])

        # lazy loading other models here (via includes) may result in an invalid query
        # e.g. SELECT  DISTINCT DISTINCT "spree_orders".id, "spree_orders"."created_at" AS alias_0 FROM "spree_orders"
        # see https://github.com/spree/spree/pull/3919
        @orders = if query_present
          @search.result(distinct: true)
        else
          @search.result
        end

        @orders = @orders.
          page(params[:page]).
          per(params[:per_page] || Spree::Config[:orders_per_page])

        @orders_with_my_products = []
        my_products = Spree::Product.items_belonging_to_user(try_spree_current_user)

        unless try_spree_current_user.admin?
          @orders.each do |order|
            order.line_items.each do |li|
              @orders_with_my_products << order if my_products.include?(li.product)
            end
          end
          @orders = @orders_with_my_products
        end

    def edit
      Rails.logger.debug "FROM APP IN EDIT\n\n"
      require_ship_address

      @order = @order.clone

      unless try_spree_current_user.admin?
        my_products = Spree::Product.items_belonging_to_user(try_spree_current_user)
        my_line_items = []
        @order.line_items.each do |li|
          my_line_items << li if my_products.include?(li.product)
        end
        @order.line_items = my_line_items
      end

      unless @order.completed?
        @order.refresh_shipment_rates
      end
    end
  end
end
