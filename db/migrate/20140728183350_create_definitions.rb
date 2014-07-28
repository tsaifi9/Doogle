class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.string :text, index: true
      t.references :word, index: true

      t.timestamps
    end
  end
end
