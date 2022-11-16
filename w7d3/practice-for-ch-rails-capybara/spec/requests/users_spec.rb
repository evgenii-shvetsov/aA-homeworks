require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/new (#new)" do
    it "renders the new template" do
      get new_user_url
      expect(response.body).to include("Sign Up!")
    end
  end
  
end
