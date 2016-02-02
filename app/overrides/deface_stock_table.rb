Deface::Override.new(:virtual_path  => "spree/admin/stock_items/_stock_management",
                     :replace       => "table.stock-table",
                     :original      => '',
                     :partial       => "spree/admin/stock_items/stock_mangement",
                     :name          => "stock_table")

