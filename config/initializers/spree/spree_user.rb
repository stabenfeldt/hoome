Spree::User.class_eval do

    def vendor?
      self.role_users.any? { |ru| ru.role.name == 'vendor' }
    end

    def stock_location_id
      self.stock_locations.first.id
    end

    attr_accessor :deleted_at

end
