class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: {scope: :user_id}
end
