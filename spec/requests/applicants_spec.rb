require 'rails_helper'

RSpec.describe "Applicants", :type => :request do
  describe "GET /applicants" do
    it "works! (now write some real specs)" do
      get applicants_path
      expect(response.status).to be(200)
    end
  end
end
