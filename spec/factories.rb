require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'test@example.com'
  u.password 'password'
end
