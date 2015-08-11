class Bookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  mount_uploader :image, BookmarkImageUploader

  validates :url, presence: true
  validates :url, format: { with: URI::regexp(%w(http https)), message: "This is an invalid URL. It should start with http or https"}
  validates :title, presence: true

  def self.build_card(params)
    bookmark = new(params)
    thumbnail = ThumbnailService.new(params[:url])
    bookmark.title = thumbnail.title
    bookmark.thumbnail_url = thumbnail.url
    bookmark
  end
  
 end 
