require 'rails_helper'

RSpec.describe "vacancies/edit", :type => :view do
  before(:each) do
    @vacancy = assign(:vacancy, Vacancy.create!(
      :name => "MyString",
      :validity => 1,
      :salary => 1
    ))
  end

  it "renders the edit vacancy form" do
    render

    assert_select "form[action=?][method=?]", vacancy_path(@vacancy), "post" do

      assert_select "input#vacancy_name[name=?]", "vacancy[name]"

      assert_select "input#vacancy_validity[name=?]", "vacancy[validity]"

      assert_select "input#vacancy_salary[name=?]", "vacancy[salary]"
    end
  end
end
