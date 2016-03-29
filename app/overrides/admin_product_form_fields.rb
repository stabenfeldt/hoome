Deface::Override.new(virtual_path: 'spree/admin/products/edit',
                     replace:      "[data-hook='admin_product_form_fields']",
                     original:     '',
                     partial:      'spree/admin_product_form_fields',
                     name:         'admin_product_form_fields')
