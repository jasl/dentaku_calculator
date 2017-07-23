# This migration comes from form_core (originally 20170430190404)
class CreateForms < ActiveRecord::Migration[5.1]
  def change
    create_table :form_core_forms do |t|
      t.string :type, null: false, index: true

      t.timestamps
    end
  end
end
