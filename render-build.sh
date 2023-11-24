# exit on error

bundle install
bundle exec rails db:drop
bundle exec rails db:create
bundle exec rails db:migrate

#if you have seeds to run add:
# bundle exec rails db:seed
