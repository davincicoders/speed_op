require 'rails_helper'

RSpec.describe "sites/index", type: :view do
  before(:each) do
    assign(:sites, [
      Site.create!(
        :url => "Url"
      ),
      Site.create!(
        :url => "Url"
      )
    ])
  end

  it "renders a list of sites" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
