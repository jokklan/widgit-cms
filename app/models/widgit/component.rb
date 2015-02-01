module Widgit
  class Component < ActiveRecord::Base
    include Positionable
    include Configurable

    # Extensions
    positionable :tile

    # Association
    belongs_to :tile, inverse_of: :components

    # Attributes
    attr_accessor :disabled

    # Validations
    validates :tile, :type, presence: true

    # Instance Methods
    def to_json
      attributes.symbolize_keys.slice(:id, :type, :position).merge(self.properties || {}).compact.to_json
    end

    def component_type
      type.demodulize.downcase
    end

    # Class Methods
    def self.types
      %w(header text image icon)
    end
  end
end
