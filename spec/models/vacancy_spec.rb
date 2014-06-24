# == Schema Information
#
# Table name: vacancies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  validity    :integer
#  salary      :integer
#  created_at  :datetime
#  updated_at  :datetime
#  expire_date :datetime
#

require 'rails_helper'

describe Vacancy do
  let (:vacancy) { create :vacancy }

  describe "#set_expire_date" do
    it "should set validity to default value if it's not present" do
      vacancy.expire_date.should eq(vacancy.created_at + CONFIG[:default_vacancy_validity].days)
    end
  end

  describe "#for_applicant" do
    it "should show only active vacancies" do
      Vacancy.all.should_not include(expired_vacancy)
    end
  end

end
