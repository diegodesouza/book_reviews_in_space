class Book < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
end
