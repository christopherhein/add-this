# Configuration Class
#
# this allows to you to setup all your configuration
# params through an initializer such as:
#
# config/initializers/add_this.rb
#
# @example
#   AddThis.configure do
#     config.user_id    = "generalthings"
#     config.password   = "password"
#   end

module AddThis

  class Configuration

    # Define the available methods
    attr_accessor :user_id, :password

    def initialize
      @user_id    = "generalthings"
      @password   = "password"
    end
  end

  # Defines configuration method to allow
  # Configuration.new to be stored on the 
  # global object
  class << self
    attr_accessor :configuration
  end

  # Allows you to build a configure block
  #
  # @option options [String] :user_id login to Add This
  # @option options [String] :password password to Add This
  # @return [Boolean]
  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
    true
  end

end
