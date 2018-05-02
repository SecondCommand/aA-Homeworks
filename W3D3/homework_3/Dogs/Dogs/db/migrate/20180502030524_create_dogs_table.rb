class CreateDogsTable < ActiveRecord::Migration[5.2]
    def change
        create_table :dogs do |t|
            t.string :name, null: false # this makes it not null
            #doesn't let name be null
            t.timestamps # keeps track of when changes were made
        end
    end
end
