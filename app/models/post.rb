class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic
  
  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def per_page(num)
  num = num.to_i
  next_pager = pager.at(pager.current_page, num)
  __new__(next_pager.dataset, pager: next_pager)
  end
end
