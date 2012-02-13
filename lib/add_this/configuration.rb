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
    attr_accessor :user_id, :password

    def initialize
      @user_id    = "generalthings"
      @password   = "password"
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

end
