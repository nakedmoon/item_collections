class Item < ActiveRecord::Base

  validates :description, presence: true
  validates :url, presence: true
  validates :name, presence: true

  paginates_per 10

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user, :counter_cache => true


  def owned_by?(user)
    user && user_id == user.id
  end

end
