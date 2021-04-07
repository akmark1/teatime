class Item < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :url
    validates :image
  end
end
