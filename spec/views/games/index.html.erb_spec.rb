require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    assign(:games, [
      Game.create!(
        :title => "Title",
        :description => "Description",
        :price => 2.5
      ),
      Game.create!(
        :title => "Title",
        :description => "Description",
        :price => 2.5
      )
    ])
  end

  it "renders a list of games" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
  end
end
