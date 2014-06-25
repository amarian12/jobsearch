# == Schema Information
#
# Table name: applicants
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  surname    :string(255)
#  patronymic :string(255)
#  status     :string(255)
#  salary     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

describe Applicant do
  let(:applicant) { create :applicant }
  let(:vacancy) { create :vacancy }

  describe "#for_vacancy" do
    let(:inactive_applicant) { create :applicant, :inactive }

    it "should include active applicants" do
      Applicant.for_vacancy(vacancy.skills).should include(applicant)
    end

    it "should not include inactive applicants" do
      Applicant.for_vacancy(vacancy.skills).should_not include(inactive_applicant)
    end
  end

end
