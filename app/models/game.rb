class Game < ApplicationRecord
  belongs_to :user
  mount_uploader :cover, CoverUploader
end
