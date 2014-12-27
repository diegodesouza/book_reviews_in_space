class Book < ActiveRecord::Base
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, length: { minimum: 1 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :url, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
end
