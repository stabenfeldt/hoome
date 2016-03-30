Spree::Order.class_eval do

  scope :belonging_to_user, -> (user) { includes(:products)
    .where(master: { stock_location_id: user.stock_locations.present? && user.stock_locations.first.id })
  }

  # TODO Rename to products_belonging_to_user
  def self.belonging_to_user(user)
    self.products.each { |p| p.master.stock_locations_ids.include? user.stock_locations.first.id }
  end

  def display_total(user=nil)
    if user.blank? or user.admin?
      sum_price = self.line_items.map { |i| i.product }.sum(&:price)
    else
      sum_price = self.line_items.select { |i| i.belongs_to_user?(user) }.sum(&:price)
    end
    Spree::Money.new(sum_price, { currency: self.currency })
  end

end
