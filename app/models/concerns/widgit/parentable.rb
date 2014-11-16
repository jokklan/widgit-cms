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
        accepts_nested_attributes_for parentable_children_association, allow_destroy: true

        define_method("#{parentable_children_association}_attributes=") do |attributes_collections|
          ids_to_add = attributes_collections.values.map { |attributes| attributes[:id] } - self.send("#{parentable_children_association.to_s.singularize}_ids")

          ids_to_add.each do |id|
            self.send(parentable_children_association) << "Widgit::#{parentable_children_association.to_s.singularize.classify}".constantize.find(id)
          end

          super(attributes_collections)
        end
      end
    end
  end
end
