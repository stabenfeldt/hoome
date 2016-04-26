module Spree
  Api::ShipmentsController.class_eval do

      before_filter :find_order_on_create, only: :create
      before_filter :find_shipment, only: [:update, :ship, :ready, :add, :remove, :ready_for_pickup]
      before_action :load_transfer_params, only: [:transfer_to_location, :transfer_to_shipment]
      around_filter :lock_order, except: [:mine]
      before_filter :update_shipment, only: [:ship, :ready, :ready_for_pickup, :add, :remove]


      def find_shipment
        if @order.present?
          @shipment = @order.shipments.find_by!(number: params[:id])
        else
          @shipment = Spree::Shipment.readonly(false).find_by!(number: params[:id])
          @order = @shipment.order
        end
        authorize! :update, @shipment
      end

      def update_shipment
        @shipment.update_attributes(shipment_params)
        @shipment.reload
      end


      def ready_for_pickup
        authorize! :ship, @shipment
        unless @shipment.shipped?
          Rails.logger.debug "\n READY for pickup from DECORATOR"
          # @shipment.suppress_mailer = (params[:send_mailer] == 'false')
          @shipment.ready_for_pickup!
        end
        debugger
        respond_with(@shipment, default_template: :show)
      end


  end
end

