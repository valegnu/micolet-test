class CreateSuscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :suscriptions do |t|
      t.string :email, null: false
      t.json :preferences, null: false

      t.timestamps
    end
    add_index :suscriptions, :email, unique: true
  end
end
