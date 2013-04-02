class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :opinion, :post_id, :user_id

  validates :post_id, presence: true
  validates :user_id, presence: true 
  validates :opinion, presence: true
end
