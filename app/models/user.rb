class User < Spree::User

  include Spree::UserMethods

  def vendor?
    self.role_users.any? { |ru| ru.role.name == 'vendor' }
  end

end
