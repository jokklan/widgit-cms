module Widgit
  module Parentable
    extend ActiveSupport::Concern

    included do
      # Callbacks
      before_validation :destroy_if_empty, on: :update
    end

  private

    def destroy_if_empty
      self.destroy if parentable_children.size.zero?
    end

    def parentable_children
      send(parentable_children_association)
    end

    module ClassMethods
      def parentable(children_association)
        class_attribute :parentable_children_association

        self.parentable_children_association = children_association.to_sym

        validates parentable_children_association, presence: true
      end
    end
  end
end
