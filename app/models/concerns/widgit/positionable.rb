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
      public_send(positionable_parent_association)
    end

    def positionable_association
      positionable_parent.public_send(positionable_children_association)
    end

    module ClassMethods
      def positionable(parent_association, children_association = nil)
        class_attribute :positionable_parent_association
        class_attribute :positionable_children_association

        self.positionable_parent_association = parent_association.to_sym
        self.positionable_children_association = (children_association || model_name.element.pluralize).to_sym
      end
    end
  end
end
