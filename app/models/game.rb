class Game < ApplicationRecord
  belongs_to :developer, class_name: 'User', foreign_key: :developer_id
  mount_uploader :cover, CoverUploader
  validates :title, :description, :price, :cover, presence: true
  validates :cover, file_size: { less_than: 3.megabytes }
end
