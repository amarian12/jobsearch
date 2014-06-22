require 'rails_helper'

RSpec.describe "applicants/index", :type => :view do
  before(:each) do
    assign(:applicants, [
      Applicant.create!(
        :name => "Name",
        :surname => "Surname",
        :patronymic => "Patronymic",
        :status => "Status",
        :salary => 1
      ),
      Applicant.create!(
        :name => "Name",
        :surname => "Surname",
        :patronymic => "Patronymic",
        :status => "Status",
        :salary => 1
      )
    ])
  end

  it "renders a list of applicants" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Surname".to_s, :count => 2
    assert_select "tr>td", :text => "Patronymic".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
