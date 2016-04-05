Spree::Order.state_machine.after_transition :to => :complete, :do => :update_shipment_state

def update_shipment_state
  self.shipments.each { |s| s.update_attribute(:vendor_shipping_state, :prepare_for_pickup) }
end

