require 'spec_helper'

RSpec.describe "Spree user" do
  it "works without FactoryGirl" do
    expect {
      Spree::User.new(deleted_at: Time.current)
    }.not_to raise_error
  end
end
