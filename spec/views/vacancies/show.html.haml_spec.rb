require 'rails_helper'

RSpec.describe "vacancies/show", :type => :view do
  before(:each) do
    @vacancy = assign(:vacancy, Vacancy.create!(
      :name => "Name",
      :validity => 1,
      :salary => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
