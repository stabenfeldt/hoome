Spree::Product.class_eval do

  scope :items_belonging_to_user, ->(user) { includes(:stock_items)
    .where( spree_stock_items: { stock_location_id: user.stock_locations.present? && user.stock_locations.first.id  } )
  }

end
