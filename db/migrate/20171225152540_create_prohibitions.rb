class CreateProhibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :prohibitions do |t|
      t.references :user, null: false
      t.string :prohibition_type, null: false
      t.string :word, null: false

      t.timestamps
    end
  end
end
