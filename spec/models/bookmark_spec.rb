require 'rails_helper'

RSpec.describe Bookmark, :type => :model do
  it "is valid with a url" do
    expect(build(:bookmark)).to be_valid
  end

  it "is invalid with out a url" do
    bookmark = build(:bookmark, url: nil)
    bookmark.valid?
    expect(bookmark.errors[:url]).to include("can't be blank")
  end

  it "is invalid with out a title" do
    bookmark = build(:bookmark, title: nil)
    bookmark.valid?
    expect(bookmark.errors[:title]).to include("can't be blank")
  end

end
