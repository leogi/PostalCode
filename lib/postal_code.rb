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

    def first
      self.postals.first
    end

    def last
      self.postals.last
    end

    def object_at *indexes
      begin
        return self.postals[indexes.first] if indexes.length == 1
        return self.postals[indexes.first, indexes.last] if indexes.length == 2
      rescue TypeError
      end
      return nil
    end

    class << self
      def where conditions = {}
        PostalCode::JapanPostal.instance.detect(conditions)
      end
      
      def first
        PostalCode::JapanPostal.instance.first
      end

      def last
        PostalCode::JapanPostal.instance.last
      end

      def object_at *indexes
        PostalCode::JapanPostal.instance.object_at *indexes
      end
    end

  end
end
