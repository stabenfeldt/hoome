Spree::Order.class_eval do


  def self.belonging_to_user(user)
    self.products.each do |p|
      p.master.stock_locations_ids.include? user.stock_locations.first.id
    end
  end


  scope :belonging_to_user, -> (user) { includes(:products)
    .where(master: { stock_location_id: user.stock_locations.present? && user.stock_locations.first.id })
  }

  # scope :items_belonging_to_user, -> (user) { includes(:stock_items)
  #   .where( spree_stock_items: { stock_location_id: user.stock_locations.present? && user.stock_locations.first.id  } )
  # }

end
