FactoryGirl.define do
  factory :test_user, class: Spree.user_class do
    email { 'yo@man.com' }
    login { email }
    password 'secret'
    stock_locations {kjk}
  end
end
