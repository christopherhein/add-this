# Request module
#
# gets included in the client this is were all the actual api calls are created

module AddThis

  module Requests
    
    # requests method
    #
    # Defines the get request for all the methods by splitting the method name
    # and the underscore to keep things dry as well allows your to pass a hash 
    # for all the query params
    #
    # @option args [Array] all of the symbolized method names
    def self.requests(*args)
      args.each do |arg|
        define_method arg do |*options|
          metric, dimension = arg.to_s.split("_")
          connection.get("/analytics/1.0/pub/#{metric}/#{dimension}.json", options[0]).body
        end
      end
    end
  
    # Requests
    #
    # All availble methods that will hit the api
    requests :shares_day, :shares_url, :shares_domain, :shares_service, 
             :shares_interest, :shares_continent, :shares_country, :clicks_day,
             :clicks_url, :clicks_domain, :clicks_service, :clicks_interest, 
             :clicks_continent, :clicks_country, :subscriptions_day, :subscriptions_url,
             :subscriptions_domain, :subscriptions_service, :subscriptions_interest,
             :subscriptions_continent, :subscriptions_country, :sharers_day, 
             :sharers_interest, :influencers_day, :influencers_interest, :clickers_day,
             :clickers_interest, :users_day, :users_interest, :searches_term, 
             :referers_domain


  end

end
