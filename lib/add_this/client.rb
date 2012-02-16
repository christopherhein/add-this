# Client Class
#
# builds a base class for all the api calls
# to inherit from.

require "add_this/requests"

module AddThis

  class Client
    # include all other classes to inherit from
    include Requests

    attr_accessor :user_id, :password

    # Creating the base client
    #
    # @option opts [String] :user_id login for Add This
    # @option opts [String] :password password for Add This
    #
    # @example
    #   AddThis::Client.new
    def initialize(opts = {})
      @user_id    = opts[:user_id]  || AddThis.configuration.user_id
      @password   = opts[:password] || AddThis.configuration.password
      connection.basic_auth(@user_id, @password)
    end

    # Creates a Faraday connection block
    #
    # @return [Faraday::Connection]
    def connection
      @connection ||= Faraday.new(url: base_url, headers: default_headers, ssl: {verify: false}) do |builder|
        builder.use Faraday::Request::UrlEncoded
        builder.use Faraday::Response::Mashify
        builder.use Faraday::Response::ParseJson
        builder.adapter Faraday.default_adapter
      end
    end
    
    protected

      # @protected
      def base_url
        "https://api.addthis.com/analytics/1.0/pub/"
      end

      # @protected
      def default_headers
        {
          accept:  'application/json',
          user_agent: 'Ruby gem',
        }
      end

  end
  
  class << self
    attr_accessor :client
  end

  def self.get
    self.client ||= Client.new
  end

end
