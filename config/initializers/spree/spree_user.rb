Spree::User.class_eval do
    def vendor?
      self.role_users.any? { |ru| ru.role.name == 'vendor' }
    end

    def admin?
      self.role_users.any? { |ru| ru.role.name == 'admin' }
    end

    def stock_location_id
      self.stock_locations.first.id
    end
end

Spree::LegacyUser.class_eval do
    def vendor?
      self.role_users.any? { |ru| ru.role.name == 'vendor' }
    end

    def admin?
      self.role_users.any? { |ru| ru.role.name == 'admin' }
    end

    def stock_location_id
      self.stock_locations.first.id
    end
end
