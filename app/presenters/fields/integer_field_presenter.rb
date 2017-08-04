module Fields
  class IntegerFieldPresenter < FieldPresenter
    include Concerns::Fields::PresenterForNumberField

    def integer_only?
      true
    end
  end
end
