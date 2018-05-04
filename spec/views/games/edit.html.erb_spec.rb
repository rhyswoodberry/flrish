require 'rails_helper'

RSpec.describe "games/edit", type: :view do
  before(:each) do
    @game = assign(:game, Game.create!(
      :title => "MyString",
      :description => "MyString",
      :price => 1.5
    ))
  end

  it "renders the edit game form" do
    render

    assert_select "form[action=?][method=?]", game_path(@game), "post" do

      assert_select "input[name=?]", "game[title]"

      assert_select "input[name=?]", "game[description]"

      assert_select "input[name=?]", "game[price]"
    end
  end
end
