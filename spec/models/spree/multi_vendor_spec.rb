require 'spec_helper'

describe Spree::Product, :type => :model do

  context '#items_belonging_to_user' do
    let!(:product)        { create(:product) }
    #let!(:user)           { create(:user) }
    #let!(:variant)        { product.master }
    #let!(:stock_location) { create(:stock_location) }
    #let!(:stock_item)     { variant.stock_items.first }

    it 'returns only products that belong to the same stock location as the user' do
      user.stock_location_ids = [stock_location.id]
      product.master.stock_location_ids = [stock_location.id]
      expect( Spree::Product.items_belonging_to_user(user).first).to eq product
    end
  end

end
