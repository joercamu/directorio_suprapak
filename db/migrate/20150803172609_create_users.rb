class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :office
      t.string :ext
      t.string :phone
      t.references :departament, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
