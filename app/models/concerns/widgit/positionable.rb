module Widgit
  module Positionable
    extend ActiveSupport::Concern

    included do
      # Configuration
      default_scope { order(:position) }

      # Validations
      validates :position, presence: true

      # Callbacks
      before_validation :set_position, on: :create
    end

  private

    def set_position
      self.position ||= begin
        if positionable_parent && (last_block = positionable_association.last)
          last_block.position.to_i + 1
        else
          0
        end
      end
    end

    def positionable_parent
      public_send(self.class.positionable_parent)
    end

    def positionable_association
      raise positionable_parent.inspect
      positionable_parent.public_send(self.class.model_name.element.pluralize)
    end

    module ClassMethods
      def positionable(parent)
        attr_accessor :positionable_parent

        @positionable_parent = parent.to_sym
      end
    end
  end
end
