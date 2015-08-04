class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :lkes, dependent: :destroy

  mount_uploader :image, BookmarkImageUploader

  validates :url, presence: true
  validates :url, format: { with: URI::regexp(%w(http https)), message: "This is an invalid URL. It should start with http or https"}
 end 
