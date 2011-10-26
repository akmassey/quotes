class Quote < ActiveRecord::Base
  attr_accessible :text, :source_url, :author_attributes

  validates_presence_of :text, :on => :create, :message => "can't be blank"

  belongs_to :author, :class_name => "Author", :foreign_key => "author_id"

  accepts_nested_attributes_for :author

  # TODO: if a URL is provided, it should be validated as a URL with a regex
end
