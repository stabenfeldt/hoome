Spree::OrderMailer.class_eval do
  def confirm_email(order, resend = false)
    @order = find_order(order)
    @store = @order.store
    subject = build_subject(Spree.t('order_mailer.confirm_email.subject'), resend)

    # Fetch emails to the vendors:
    vendors = @order.products.map do |p|
      Spree::User.select { |u| u.stock_location_ids.first == p.master.stock_locations.first.id }
    end
    @vendor_emails = vendors.flatten.collect(&:email).uniq.join(',')
    @vendor_emails << 'martin@stabenfeldt.net'

    mail(to: @order.email, bcc: @vendor_emails,  from: from_address(@store), subject: subject)
  end
end
