module Widgit
  module Configurable
    extend ActiveSupport::Concern

    module ClassMethods
      def configurable(attributes = {})
        class_attribute :configurable_attributes

        self.configurable_attributes = attributes
      end
    end
  end
end
