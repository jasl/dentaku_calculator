class VirtualModel < FormCore::VirtualModel
  class << self
    def nested_models
      @nested_models ||= {}
    end
  end

  attribute :expression, :string, default: ''

  validate do
    next if expression.blank?

    begin
      dentaku.evaluate!(expression, to_h)
    rescue Dentaku::ParseError => ex
      errors.add :expression, ex.reason, ex.meta
    rescue Dentaku::TokenizerError => ex
      errors.add :expression, ex.reason, ex.meta
    rescue Dentaku::ArgumentError => ex
      errors.add :expression, ex.reason, ex.meta
    rescue Dentaku::UnboundVariableError => ex
      errors.add :expression, :unbound_variable, unbound: ex.unbound_variables.join(', ')
    rescue Dentaku::ZeroDivisionError
      errors.add :expression, :zero_division
    end
  end

  def dentaku
    @dentaku ||= Dentaku::Calculator.new
  end

  def evaluate
    dentaku.evaluate(expression, to_h)
  end
end
