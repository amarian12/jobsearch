require 'rails_helper'

RSpec.describe "vacancies/index", :type => :view do
  before(:each) do
    assign(:vacancies, [
      Vacancy.create!(
        :name => "Name",
        :validity => 1,
        :salary => 2
      ),
      Vacancy.create!(
        :name => "Name",
        :validity => 1,
        :salary => 2
      )
    ])
  end

  it "renders a list of vacancies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
