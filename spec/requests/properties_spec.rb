require 'rails_helper'

RSpec.describe "Properties", type: :request do
  describe "GET /properties" do
    it "responds with success " do
      get properties_path
      expect(response).to have_http_status(200)
    end
  end
end
