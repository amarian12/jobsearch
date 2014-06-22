require 'rails_helper'

RSpec.describe "applicants/new", :type => :view do
  before(:each) do
    assign(:applicant, Applicant.new(
      :name => "MyString",
      :surname => "MyString",
      :patronymic => "MyString",
      :status => "MyString",
      :salary => 1
    ))
  end

  it "renders new applicant form" do
    render

    assert_select "form[action=?][method=?]", applicants_path, "post" do

      assert_select "input#applicant_name[name=?]", "applicant[name]"

      assert_select "input#applicant_surname[name=?]", "applicant[surname]"

      assert_select "input#applicant_patronymic[name=?]", "applicant[patronymic]"

      assert_select "input#applicant_status[name=?]", "applicant[status]"

      assert_select "input#applicant_salary[name=?]", "applicant[salary]"
    end
  end
end
