user = Spree::User.last
stock_item = Spree::StockItem.last
ability = Spree::Ability.new(user)
ability.can?(:view, stock_item)
