class AddVendorShippingStateToSpreeShipments < ActiveRecord::Migration
  def change
    add_column :spree_shipments, :vendor_shipping_state, :string
  end
end
