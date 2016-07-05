# Hoome

## User stories

This describes the main functionality.

#### Vendor sale story
1. Customer buys a product
2. Customer receives an confirmation mail.
   - Vendor should also receive an email.
3. Vendor can see the latest order in his admin page.
4. The vendor notifies Hoome that the package is ready for shipment.
5. Hoome sends a delivery guy to pick up the package.
6. Customer receives the order.

#### Order story for Customers
1. Buys product
2. Receives a confirmation email.
3. Receives the product.

####Order story for Hoome admins
1. Customer buys a product
2. Hoome receives an order email.
3. The order has the status "waiting for vendor to prepare package".
4. When the package changes status to "package ready for pickup" we send a
   messenger.
5. After 14 days, we transfer the sales amount minus fee and shipping costs.

-

## Goals for the Alpha version

* A vendor can add his own products
  - Done, but needs some polishing.

* A vendor can only access /admin/products. The rest of the admin interface is hidden.
  - Done

* The admin gets an email when a product is sold. He then emails the vendor regarding which product is sold to whom.
  The vendor prepares the product and informs the admin that it's ready to be picked up.
  The admin transfers the money the customer payed, to the vendor 14 days after the product is delivered to the customer.

## Install
It should be enough to clone the repo, run migrations and seed the db.


#### Seed the database
Please read the seeds.rb for more details.
```
$ rake db:seed
```
This populates the db with
  - a few users
  - 3 vendors with their belonging stock location
  - taxonomies

Add the vendor role to a user. This can be done throught the web interface.

Remember to generate an API key for that user in the Solidus admin interface.


## We're extending the 1.3 version of Solidus.
To work directly agains that version do:
`git clone -b v1.2.0 git@github.com:solidusio/solidus.git solidus`
Point Gemfile to this directory


## Solidus

Customice the app by modifiying config/initializers/spree.rb

### Howto add custom permission sets
See http://stackoverflow.com/questions/34980121/howto-add-a-new-role-with-a-custom-permission-set-for-solidus-spree/34982756#34982756


