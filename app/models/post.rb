class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  default_scope { order('created_at DESC') }
  scope :ordered_by_title, lambda { order('title DESC') }
  scope :ordered_by_reverse_created_at, lambda { order('created_at ASC') }
end
