class CreateToys < ActiveRecord::Migration[5.2]
  def change
    create_table :toys do |t|
        t.string :name, null: false
        t.integer :dog_id, null: false
        t.timestamps #recommended for all
    end
  end
end
