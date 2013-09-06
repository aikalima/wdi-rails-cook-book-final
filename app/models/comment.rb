class Comment < ActiveRecord::Base
  attr_accessible :name, :body, :book_id

  belongs_to :book
end
