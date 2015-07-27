require 'rails_helper'

RSpec.describe Topic, :type => :model do
  it "is valid with title" do
    expect(build(:topic)).to be_valid
  end

  it "is invalid without a title" do
    topic = build(:topic, title:nil)
    topic.valid? 
    expect(topic.errors[:title]).not_to include("can't be blank")
   end

end
