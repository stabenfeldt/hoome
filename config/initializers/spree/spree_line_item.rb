Spree::LineItem.class_eval do

  def belongs_to_user?(user)
    product.master.stock_location_ids.include? user.stock_location_ids.first
  end

end
