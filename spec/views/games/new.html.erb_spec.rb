require 'rails_helper'

RSpec.describe "games/new", type: :view do
  before(:each) do
    assign(:game, Game.new(
      :title => "MyString",
      :description => "MyString",
      :price => 1.5
    ))
  end

  it "renders new game form" do
    render

    assert_select "form[action=?][method=?]", games_path, "post" do

      assert_select "input[name=?]", "game[title]"

      assert_select "input[name=?]", "game[description]"

      assert_select "input[name=?]", "game[price]"
    end
  end
end
