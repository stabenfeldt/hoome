module ApplicationHelper

  def admin?
    try_spree_current_user.admin?
  end

  def vendor?
    try_spree_current_user.vendor?
  end

  def current_user
    try_spree_current_user
  end

  def matches_our_stock_location?(stock_location_id)
    try_spree_current_user.stock_location_ids.include? stock_location_id
  end

end
