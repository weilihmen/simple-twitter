class Tweet < ApplicationRecord
  validates_length_of :description, maximum: 140
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :replies, dependent: :destroy
end