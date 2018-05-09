class Game < ApplicationRecord
  belongs_to :user
  mount_uploader :cover, CoverUploader
  # validates :title, :description, :price, :cover, presence: true
  validates :cover, file_size: { less_than: 3.megabytes }
end
