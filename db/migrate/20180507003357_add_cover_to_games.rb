class AddCoverToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :cover, :string
  end
end
