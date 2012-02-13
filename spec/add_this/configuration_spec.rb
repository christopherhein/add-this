require "spec_helper"

describe AddThis::Configuration do

  let(:config) { AddThis::Configuration.new }
  let(:configure) do
    AddThis.configure do |config|
      config.user_id    = "chris"
      config.password   = "hein"
    end
  end
  
  context "instantiation" do

    it "should have a new method" do
      AddThis::Configuration.should respond_to :new
    end

    it "should return configuration object" do
      configure.should eq "hein"
    end

  end

  context "attrs" do

    it "should have a attr of user_id" do
      config.should respond_to :user_id
    end

    it "should have an attr of password" do
      config.should respond_to :password
    end

  end
  
  context "getting the attrs" do
    
    it "should have access to the configuration variables for user_id" do
      AddThis.configuration.should respond_to :user_id
    end

    it "should have access to the configuration variables for password" do
      AddThis.configuration.should respond_to :password
    end

    it "should have chris for user_id" do
      AddThis.configuration.user_id.should eq "chris"
    end

    it "should have chris for password" do
      AddThis.configuration.password.should eq "hein"
    end

  end

  context "base class" do

    it "should have an attribute of configuration" do
      AddThis.should respond_to :configuration
    end
    
    it "should have a method for configure" do
      AddThis.should respond_to :configure
    end

  end

end
