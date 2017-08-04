module Concerns::Fields
  module Validations::Exclusion
    extend ActiveSupport::Concern

    included do
      embeds_one :exclusion, anonymous_class: ExclusionOptions
    end

    def interpret_to(model, field_name, accessibility, options = {})
      super
      exclusion.interpret_to model, field_name, accessibility, options
    end

    class ExclusionOptions < FieldOptions
      attribute :message, :string, default: ""
      attribute :in, :string, default: [], array: true

      def interpret_to(model, field_name, _accessibility, _options = {})
        return if self.in.empty?

        options = {in: self.in}
        options[:message] = message if message.present?

        model.validates field_name, exclusion: options, allow_blank: true
      end
    end
  end
end
