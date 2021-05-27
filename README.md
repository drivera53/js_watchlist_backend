# Flatcoin Watchlist JS Back End
Welcome to FlatCoin Watchlist JS! This App was develop as a Flatiron School JS project. I developed this app to help users create cryptocurrency watchlists.

# Installation
Fork this back end repository and Install all of the required gems: (If you run into issues try deleting `Gemfile.lock` and then `bundle install` again.)
```ruby
bundle install
```
If you want to start with a fresh new database you may delete `development.sqlite` and `schema.rb`; then run:
```ruby
rails db:migrate
```
But you must run `seeds.rb` in order to create all coins (7000+) objects thay you'll need when running the app.
```ruby
rake db:seed
```
Make sure to fork its [front end repository](https://github.com/drivera53/js_watchlist) as well.

# Usage
Run `rails s` to start the server and then open `index.html` form the front end repository. Here you may start creating watchlists and adding your favorite Crytocurrencies. Each watchlist displays a list of all your coins along with valuable updated information such as current price, market cap, circulating supply, logo and many more. 

# License
[MIT](https://github.com/drivera53/js_watchlist_backend/blob/main/LICENSE)
