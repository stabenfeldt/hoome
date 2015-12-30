# Hoome

### Install
bundle
rake db:create db:migrate
bundle exec rails g spree:install

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



