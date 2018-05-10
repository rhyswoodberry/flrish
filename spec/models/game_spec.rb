require 'rails_helper'

RSpec.describe Game, type: :model do
  it "game is only valid if a user exists" do
    user = User.create!(email: 'example@example.com', password: '123456')
    game = Game.create!(title: 'EG', description: 'Example', price: '10.99', cover: 'example.png')
    expect Game.to eq([:title, :description, :price, :cover, :user_id])
  end
end
