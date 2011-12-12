require 'factory_girl'

Factory.define :user do |u|
  u.name 'First User'
  u.email 'user@example.com'
  u.password 'password'
end

Factory.define :quote do |q|
  q.text "This is a test quotation."
  q.source_url "http://www.example.com"
end

Factory.define :author do |a|
  a.name "Test Author"
end
