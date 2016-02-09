require 'spec_helper'

describe Spree::MultiVendorAbility do
  let(:ability) { Spree::MultiVendorAbility.new(user) }
  let(:user)    { create(:user) }
  let(:product) { create :product }
	let(:stock_location) { create(:stock_location_with_items) }
	let(:stock_item) { stock_location.stock_items.order(:id).first }

  subject { ability }

  context "test" do
    before do
      Rails.logger.debug "The StockItem is #{stock_item.inspect}"
      user.stock_locations = [stock_location]
      user.save
    end

    context "when the user is associated with the stock location" do
      #it { is_expected.to be_able_to(:admin,   :all) }
      #it { is_expected.to be_able_to(:create,  :all) }
      #it { is_expected.to be_able_to(:display, :all) }
      it { is_expected.to be_able_to(:manage,  Spree::StockItem) }
    end

    context "when the user is NOT associated with the stock location" do
        before do
          stock_item.stock_location_id = nil
          stock_item.save
          user.stock_locations = []
          user.save
          puts "The StockItem is #{stock_item.inspect}"
          user.stock_locations = []
        end
        it { is_expected.to_not be_able_to(:manage, Spree::StockItem) }
    end

  end

end
