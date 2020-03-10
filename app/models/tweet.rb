class Tweet < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  validates :date, presence: true, length: { maximum: 255 }
end
