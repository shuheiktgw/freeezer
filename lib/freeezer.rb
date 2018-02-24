require "freeezer/version"

module Freeezer
  refine Hash do
    def deep_freeze
     self.freeze
     self.each do |_key, value|
       if value.is_a?(Array) || value.is_a?(Hash)
         value.deep_freeze
       end
       value.freeze
     end
    end
  end

  refine Array do
    def deep_freeze
      self.freeze
      self.each do |value|
        if value.is_a?(Array) || value.is_a?(Hash)
          value.deep_freeze
        end
        value.freeze
      end
    end
  end
end
