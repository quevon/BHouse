require 'rails_helper'

RSpec.describe "Properties", type: :request do
  describe "GET /properties" do
    it "works! (now write some real specs)" do
      get properties_path
      expect(response).to have_http_status(200)
    end
  end
end
