require 'rails_helper'

RSpec.describe "applicants/edit", :type => :view do
  before(:each) do
    @applicant = assign(:applicant, Applicant.create!(
      :name => "MyString",
      :surname => "MyString",
      :patronymic => "MyString",
      :status => "MyString",
      :salary => 1
    ))
  end

  it "renders the edit applicant form" do
    render

    assert_select "form[action=?][method=?]", applicant_path(@applicant), "post" do

      assert_select "input#applicant_name[name=?]", "applicant[name]"

      assert_select "input#applicant_surname[name=?]", "applicant[surname]"

      assert_select "input#applicant_patronymic[name=?]", "applicant[patronymic]"

      assert_select "input#applicant_status[name=?]", "applicant[status]"

      assert_select "input#applicant_salary[name=?]", "applicant[salary]"
    end
  end
end
