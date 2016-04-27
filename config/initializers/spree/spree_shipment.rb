Spree::Shipment.class_eval do

  ####
  #
  # vendor_shipping_state can be one of these:
  #
  # - prepare_for_pickup
  # - ready_for_pickup
  # - sendt

  def prepare_for_pickup?
    self.vendor_shipping_state == 'prepare_for_pickup'
  end

  def ready_for_pickup?
    self.vendor_shipping_state == 'ready_for_pickup'
  end

  def ready_for_pickup!
    self.update_attribute(:vendor_shipping_state, 'ready_for_pickup')
  end

  def sent!
    self.update_attribute(:vendor_shipping_state, 'sent')
  end

  def sent?
    self.vendor_shipping_state == 'sent'
  end

end
