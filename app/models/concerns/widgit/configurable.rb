module Widgit
  module Configurable
    extend ActiveSupport::Concern

    Setting = Struct.new(:name, :data_type, :input_type, :default_value)

    included do
      class_attribute :configurable_attributes
    end

    module ClassMethods
      def configurable(settings = {})
        settings.each do |setting, options|
          add_setting(setting, options)
        end
      end

      def add_setting(name, options = {})
        options[:input_type] ||= options[:data_type]
        setting = Setting.new(name, options[:data_type], options[:input_type], options[:default_value])

        self.configurable_attributes.push(setting)
      end
    end
  end
end
