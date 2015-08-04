class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.starts_with? '#'
      record.errors[:title] << 'Need a name starting with # please!'
    end
  end
end

class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: {scope: :user_id}

  include ActiveModel::Validations
  validates_with MyValidator
end
