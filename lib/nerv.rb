require 'nerv/version'

class Nerv
  DEFAULT_SEPARATOR = '_'.freeze

  class << self
    def prefix(keys_prefix, separator = DEFAULT_SEPARATOR)
      regexp = /^#{keys_prefix}#{separator}/

      pairs = ENV.map { |k, v| [k.gsub(regexp, ''), v] if k =~ regexp }
                 .compact
                 .flatten

      Hash[*pairs]
    end

    def [](keys_prefix)
      prefix(keys_prefix)
    end
  end
end
