require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  describe "GET /contacts" do
    it "request index and return 406 ok" do
      get contacts_path
      expect(response).to have_http_status(406)
    end
    it "request index and return 200 ok" do
      request.accept = 'application/vnd.api+json'
      get contacts_path
      expect(response).to have_http_status(200)
    end
  end
end
