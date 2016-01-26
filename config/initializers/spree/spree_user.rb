Spree::User.class_eval do

    def vendor?
      self.role_users.any? { |ru| ru.role.name == 'vendor' }
    end

    attr_accessor :deleted_at

end
