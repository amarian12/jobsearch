require 'rails_helper'

RSpec.describe "vacancies/new", :type => :view do
  before(:each) do
    assign(:vacancy, Vacancy.new(
      :name => "MyString",
      :validity => 1,
      :salary => 1
    ))
  end

  it "renders new vacancy form" do
    render

    assert_select "form[action=?][method=?]", vacancies_path, "post" do

      assert_select "input#vacancy_name[name=?]", "vacancy[name]"

      assert_select "input#vacancy_validity[name=?]", "vacancy[validity]"

      assert_select "input#vacancy_salary[name=?]", "vacancy[salary]"
    end
  end
end
