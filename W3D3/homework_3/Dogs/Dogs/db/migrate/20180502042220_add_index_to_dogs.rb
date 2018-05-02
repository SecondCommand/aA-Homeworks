class AddIndexToDogs < ActiveRecord::Migration[5.2]
  def change
      add_index :dogs, :name
      # takes up space, so not for 100% of everything
  end
end
