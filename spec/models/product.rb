require 'spec_helper'


describe "Spree::Product", :type => :model do

  context 'product instance' do
    let(:product) { create(:product) }
    let(:variant) { create(:variant, :product => product) }

    it 'spec_name' do
      puts "product: #{product.inspect}"
    end
  end
end

