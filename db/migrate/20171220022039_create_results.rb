class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.references :exam, foreign_key: true
      t.references :student, foreign_key: true
      t.float :score

      t.timestamps
    end
  end
end
