require "postal_code/version"
require "singleton"
require "postal_code/import"
require "postal_code/postal"

module PostalCode
  # Your code goes here...
  class JapanPostal
    include Singleton
    include PostalCode::Import

    attr_accessor :postals

    def initialize
      self.postals = import_postal_code
    end

    def detect conditions = {}
      return self.postals if conditions.empty?
      self.postals.select{|p| p.match_conditions?(conditions)}
    end

    class << self
      def where conditions = {}
        PostalCode::JapanPostal.instance.detect(conditions)
      end
    end

  end
end
