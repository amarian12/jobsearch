require 'rails_helper'

RSpec.describe "applicants/show", :type => :view do
  before(:each) do
    @applicant = assign(:applicant, Applicant.create!(
      :name => "Name",
      :surname => "Surname",
      :patronymic => "Patronymic",
      :status => "Status",
      :salary => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Surname/)
    expect(rendered).to match(/Patronymic/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/1/)
  end
end
