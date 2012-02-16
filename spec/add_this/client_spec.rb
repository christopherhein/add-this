require "spec_helper"

describe AddThis::Client do
  before(:each) do
    AddThis.configure do |config|
      config.user_id    = "chris"
      config.password   = "hein"
    end
  end
  let(:client) { AddThis::Client.new }
  
  context "instantiation" do

    it "should have a new method" do
      AddThis::Client.should respond_to :new
    end

  end

  context "attrs" do
    let(:client) { AddThis::Client.new({user_id: "chris", password: "hein"}) }
    
    it "should have user_id attr" do
      client.should respond_to :user_id
    end

    it "should have password attr" do
      client.should respond_to :password
    end
  
  end
  
  context "setting the attributes" do
    let(:params) { { user_id: "chris", password: "password" } }
    let(:client) { AddThis::Client.new(params) }
    
    it "should have set the user_id" do
      client.user_id.should eq "chris"
    end

    it "should have set the password" do
      client.password.should eq "password"
    end

  end

  context "loading them from config block" do

    it "should have set the user_id" do
      client.user_id.should eq "chris"
    end

    it "should have set the password" do
      client.password.should eq "hein"
    end

  end

  context "setting up the connection" do
    let(:connection) { client.connection }
    
    it "should respond to connection" do
      client.should respond_to :connection
    end
    
    it "should return the base url" do
      client.send(:base_url).should eq "https://api.addthis.com/analytics/1.0/pub/"
    end
    
    it "should return a hash for default_headers" do
      client.send(:default_headers).should be_kind_of Hash
    end

    it "should respond with a faraday connection" do
      connection.should be_kind_of Faraday::Connection
    end
  end
  
  context "calling the API with out creating a new client" do

    it "should respond_to :client" do
      AddThis.should respond_to :client
    end
    
    it "should respond_to :get" do
      AddThis.should respond_to :get
    end

    it "should be able to make trailing requests" do
      AddThis.get.should respond_to :shares_url
    end

    it "should be a kind of Faraday::Connection" do
      AddThis.get.should be_kind_of AddThis::Client
    end

  end

end
