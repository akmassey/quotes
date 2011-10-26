class Author < ActiveRecord::Base
  attr_accessible :name, :born, :died, :bio

  validates_presence_of :name

  has_many :quotes, :dependent => :destroy
end
