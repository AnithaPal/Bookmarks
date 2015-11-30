
class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: {scope: :user_id}

end
