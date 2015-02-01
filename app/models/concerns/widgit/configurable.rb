module Widgit
  module Configurable
    extend ActiveSupport::Concern

    Setting = Struct.new(:name, :data_type, :input_type)

    module ClassMethods
      def configurable(settings = {})
        class_attribute :configurable_attributes
        self.configurable_attributes = []

        settings.each do |setting, options|
          add_setting(setting, options)
        end
      end

      def add_setting(name, options = {})
        options[:input_type] ||= options[:data_type]
        setting = Setting.new(name, options[:data_type], options[:input_type])

        if options[:default_value]
          define_method(name) do |*args|
            super(*args) || options[:default_value]
          end
        end

        self.configurable_attributes.push(setting)
      end
    end
  end
end
