# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
=begin
bundle exec rake db:seed
DEPRECATION WARNING: Sprockets method `register_engine` is deprecated.
Please register a mime type using `register_mime_type` then
use `register_compressor` or `register_transformer`.
https://github.com/rails/sprockets/blob/master/guides/extending_sprockets.md#supporting-all-versions-of-sprockets-in-processors
 (called from block (2 levels) in <class:Railtie> at /home/nomid/.rvm/gems/ruby-2.3.3/gems/sass-rails-5.0.2/lib/sass/rails/railtie.rb:57)
DEPRECATION WARNING: Sprockets method `register_engine` is deprecated.
Please register a mime type using `register_mime_type` then
use `register_compressor` or `register_transformer`.
https://github.com/rails/sprockets/blob/master/guides/extending_sprockets.md#supporting-all-versions-of-sprockets-in-processors
 (called from block (2 levels) in <class:Railtie> at /home/nomid/.rvm/gems/ruby-2.3.3/gems/sass-rails-5.0.2/lib/sass/rails/railtie.rb:58)

=end