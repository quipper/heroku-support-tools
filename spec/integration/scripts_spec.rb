require "spec_helper"

describe ScriptsController do
  describe "Get production deploy script" do

    it "responds successfully with an HTTP 200 status code" do
      get "/scripts/production_deploy.sh.txt"
      expect(response).to be_success
      expect(response.content_type.to_s).to eql('text/plain')
      expect(response.body).to be_include('function deploy()')
    end
  end

  describe "Get staging deploy script" do

    it "responds successfully with an HTTP 200 status code" do
      get "/scripts/staging_deploy.sh.txt"
      expect(response).to be_success
      expect(response.content_type.to_s).to eql('text/plain')
      expect(response.body).to be_include('function deploy()')
      expect(response.body).to be_include('http://my-deploy-tool-url.herokuapp.com/apps')
    end
  end
end
