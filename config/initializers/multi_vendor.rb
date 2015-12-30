Spree::RoleConfiguration.configure do |config|
  config.assign_permissions :vendor, [
    Spree::PermissionSets::OrderDisplay,
    Spree::PermissionSets::UserDisplay,
    Spree::PermissionSets::ProductDisplay,
    Spree::PermissionSets::MultiVendor
  ]
end
