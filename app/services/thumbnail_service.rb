class ThumbnailService
  attr_reader :object

  def initialize(site_url)
    @object = LinkThumbnailer.generate( site_url )
  end

  def title
    object.title
  end

  def url
    object.images.first.src.to_s
  rescue
    nil
  end
end