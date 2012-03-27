class Collection < ActiveRecord::Base
  attr_accessible :name, :user_id
  
  belongs_to :user
  
  has_and_belongs_to_many :quotes, :uniq => true
end
