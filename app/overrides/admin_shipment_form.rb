Deface::Override.new(:virtual_path  => 'spree/admin/orders/_shipment',
                     :replace       => "[data-hook='admin_shipment_form']",
                     #:original      => 'XX',
                     :partial       => 'spree/admin/orders/shipment',
                     :name          => "admin_shipment_form")

