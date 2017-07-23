class Form < FormCore::Form
  validates :title,
            presence: true

  has_many :fields, dependent: :destroy
end
