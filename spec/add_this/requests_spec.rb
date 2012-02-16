require "spec_helper"

class DummyClass; end

describe AddThis::Requests do
  let(:klass) { DummyClass.new }
  let(:requests) { klass.extend(AddThis::Requests) }
  
  context "instantiation" do
  end

  context "defining api calls" do

    it "should respond_to shares_day" do
      requests.should respond_to :shares_day
    end

    it "should respond_to shares_url" do
      requests.should respond_to :shares_url
    end

    it "should respond_to shares_domain" do
      requests.should respond_to :shares_domain
    end

    it "should respond_to shares_service" do
      requests.should respond_to :shares_service
    end

    it "should respond_to shares_interest" do
      requests.should respond_to :shares_interest
    end

    it "should respond_to shares_continent" do
      requests.should respond_to :shares_continent
    end

    it "should respond_to shares_country" do
      requests.should respond_to :shares_country
    end

  end

end
