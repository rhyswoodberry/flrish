require 'rails_helper'

RSpec.describe Game, type: :model do
  it "game can only be valid if a user exists" do
    user = User.new(id: '1', email: 'example@example.com', password: '123456')
    game = Game.new(title: 'EG', description: 'Example', price: '10.99', cover: 'fez.png', user_id: '1')
    expect(game).to be_valid
  end

  it "should not be valid without user" do
    game = Game.new
    expect(game).to_not be_vaild
  end
  
end
