class CreatCatsTable < ActiveRecord::Migration[5.2]
  def change
      create_table :cats do |t|
      t.string :name, null: false # this makes it not null
      #doesn't let name be null
      t.timestamps # keeps track of when changes were made
  end
end
