module Widgit
  class Component < ActiveRecord::Base
    include Positionable

    # Extensions
    positionable :tile

    # Association
    belongs_to :tile, inverse_of: :components

    # Validations
    validates :tile, :type, presence: true

    # Instance Methods
    def to_json
      attributes.symbolize_keys.compact.slice(:id, :type, :text, :position).to_json
    end

    def component_type
      type.demodulize.downcase
    end

    # Class Methods
    def self.types
      %w(header text image)
    end
  end
end
