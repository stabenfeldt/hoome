Spree::Shipment.class_eval do

  def ready_for_pickup!
    self.update_attribute(:vendor_shipping_state, :ready_for_pickup)
  end

end
