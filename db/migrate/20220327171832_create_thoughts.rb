class CreateThoughts < ActiveRecord::Migration[7.0]
  def change
    create_table :thoughts do |t|
      t.string :summary
      t.text :description
      t.string :stress_level
      t.text :additional_notes
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
