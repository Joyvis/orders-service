class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :identification_document, null: false
      t.string :email
      t.timestamps
    end

    add_index :users, :identification_document, unique: true
  end
end
