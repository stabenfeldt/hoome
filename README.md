# Hoome

# TODO
 - lag en plan med milepæler og inviter martin og hubert
 - deploy siden. legg på u/ p

## Goals for the Alpha version

* A vendor can add his own products
* A vendor can only access /admin/products. The rest of the admin interface is hidden.
* The admin gets an email when a product is sold. He then emails the vendor regarding which product is sold to whom.
  The vendor prepares the product and informs the admin that it's ready to be picked up.
  The admin transfers the money the customer payed, to the vendor 14 days after the product is delivered to the customer.
* A vendor should only see orders made to his products.

### Install
bundle
rake db:create db:migrate
bundle exec rails g spree:install

**Create a vendor role**
```
$ r c
Spree::Role.create(name: 'vendor')
```

rails server

*Admin account*
user: admin@example.com
password: test123


## Solidus
### Running tests
```
cd solidus
$ DB=sqlite sh build.sh
```

### Running single tests
```
cd solidus/core
bundle exec rspec spec/models/spree/ability_spec.rb
```


### Keeping updated
*Track the origin*
git remote add upstream git@github.com:solidusio/solidus.git
git fetch upstream
*Update*
git fetch upstream
git rebase upstream/master



