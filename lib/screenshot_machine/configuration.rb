# frozen_string_literal: true

module ScreenshotMachine
  module Configuration
    # An array of valid keys in the options hash when configuring TweetStream.
    VALID_PARAMS_KEYS = %i[
      device
      dimension
      format
      cacheLimit
      delay
      zoom
      url
      key
    ].freeze

    # @private
    attr_accessor(*VALID_PARAMS_KEYS)

    DEFAULT_DEVICE      = 'desktop'
    DEFAULT_DIMENSION   = '1024x768' # or "1024xfull" for full length screenshot
    DEFAULT_FORMAT      = 'PNG'      # JPG, GIF, PNG
    DEFAULT_CACHELIMIT  = 14         # 0-14 in days
    DEFAULT_DELAY       = 200        # 0, 200, 400, 600, 800, 1000 in ms
    DEFAULT_ZOOM        = 100
    DEFAULT_URL         = nil
    DEFAULT_KEY         = nil

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      Hash[*VALID_PARAMS_KEYS.map { |key| [key, send(key)] }.flatten]
    end

    # Reset all configuration options to defaults
    def reset
      self.device     = DEFAULT_DEVICE
      self.dimension  = DEFAULT_DIMENSION
      self.format     = DEFAULT_FORMAT
      self.cacheLimit = DEFAULT_CACHELIMIT
      self.delay      = DEFAULT_DELAY
      self.zoom       = DEFAULT_ZOOM
      self.url        = DEFAULT_URL
      self.key        = DEFAULT_KEY
      self
    end
  end
end
