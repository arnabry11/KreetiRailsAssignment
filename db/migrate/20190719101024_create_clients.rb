class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name, null: false, unique: true 
      t.string :email, null: false, unique: true 
    end
  end
end
