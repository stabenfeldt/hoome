require 'spec_helper'

describe Spree::PermissionSets::MultiVendor do
  let(:ability) { Spree::Ability.new(user) }
  let(:user)    { create(:user) }
  let(:product) { create :product }
	let(:stock_location) { create(:stock_location_with_items) }
	let(:stock_item) { stock_location.stock_items.order(:id).first }

  subject { ability }

  context "when activated" do
    before do
      user.stock_locations = [stock_location]
      described_class.new(ability).activate!

      product.master.stock_location_ids = [stock_location.id]
      product.master.save
      product.save
      product.reload
      product.master.reload
    end

    context "when the user is associated with the stock location" do
      #it { is_expected.to be_able_to(:view,  stock_item) } # WORKS
      it { is_expected.to be_able_to(:view,  product) }
      #it { is_expected.to be_able_to(:manage,  product_image) }
    end

    context "when the user is not associated with the stock location" do
        before { user.stock_locations = [] }
        it { is_expected.to_not be_able_to(:manage, Spree::StockItem) }
    end

  end

end
