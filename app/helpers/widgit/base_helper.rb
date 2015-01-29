module Widgit
  module BaseHelper
    def target_id(record)
      record.id || (Time.now.to_f * 1000).round
    end

    def resource_classes
      Widgit.components.map { |component| "Widgit::Components::#{component.classify}".constantize }
        .push(Widgit::Block)
    end

    def widgit_form_for(object, *args, &block)
      options = args.extract_options!
      simple_form_for(object, *(args << options.merge(builder: Widgit::FormBuilder)), &block)
    end
  end
end
