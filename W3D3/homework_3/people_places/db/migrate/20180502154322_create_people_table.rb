class CreatePeopleTable < ActiveRecord::Migration[5.2]
  def change
    create_table :people_table do |t|
        t.string :name, null: false
        t.integer :house_id, null: false
        t.timestamps
    end


  end
end

# rake db:create
# rake db:migrate
