require File.expand_path('../../logger', __FILE__)

module CoreNutrition
  module Configurations
    # This module is meant to store all default
    # configuration options that will be utilized
    # throughout the gem.
    #
    # These are all over-rideable through the `configure`
    # interface
    #
    module Default
      API_HOST     = 'http://api.dev.fuelthecore.com'.freeze
      USER_AGENT   = ("CORE Ruby Gem %s" % [CoreNutrition::Client::VERSION]).freeze
      MEDIA_TYPE   = 'application/vnd.core+json; version=2'.freeze
      CONTENT_TYPE = 'application/json'.freeze

      # Return the collection of default options and values
      #
      # @return [Hash] Keys and Values of default configuration
      def self.options
        Hash[CoreNutrition::Configuration.keys.map { |key| [key, __send__(key)] }]
      end

      # Return the ENV access token or nil
      #
      # @return [String, Nil]
      def self.access_token
        ENV['CORE_ACCESS_TOKEN']
      end

      # Return the ENV API Host or the default production
      # API host.
      #
      # @return [String]
      def self.api_host
        ENV['CORE_API_HOST'] || API_HOST
      end

      # Return the ENV Accept header or
      # default constant.
      #
      # @return [String]
      def self.media_type
        ENV['CORE_MEDIA_TYPE'] || MEDIA_TYPE
      end

      # Return the ENV Content-Type header or
      # default constant.
      #
      # @return [String]
      def self.content_type
        ENV['CORE_CONTENT_TYPE'] || CONTENT_TYPE
      end

      # Return the ENV User-Agent header or
      # default constant.
      #
      # @return [String]
      def self.user_agent
        ENV['CORE_USER_AGENT'] || USER_AGENT
      end

      # Return the Default CORE Logger to STDOUT.
      #
      # The default logger for Faraday to log requests.
      #
      # @return [CoreNutrition::Logger] Logger Delegator
      def self.request_logger
        CoreNutrition::Logger.new(STDOUT)
      end

      # Return the Default CORE Logger to STDOUT.
      #
      # If caching is enabled, this is the default logger.
      #
      # @return [CoreNutrition::Logger] Logger Delegator
      def self.cache_logger
        CoreNutrition::Logger.new(STDOUT)
      end

      # Return the Default CORE Logger to STDOUT.
      #
      # This is for application level logging.
      #
      # @return [CoreNutrition::Logger] Logger Delegator
      def self.logger
        CoreNutrition::Logger.new(STDOUT)
      end

      # Returns a set of default connection options.
      #
      # This will be deep merged with user-specified
      # values
      #
      # @return [Hash] Connection Options
      def self.connection_options
        {
          :headers => {
            :accept       => self.media_type,
            :user_agent   => self.user_agent,
            :content_type => self.content_type
          }
        }
      end
    end
  end
end
