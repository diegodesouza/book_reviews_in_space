class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :description, presense: true, length: { minimun: 50 }
end
