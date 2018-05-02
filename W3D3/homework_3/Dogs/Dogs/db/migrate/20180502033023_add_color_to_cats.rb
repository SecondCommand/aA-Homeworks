class AddColorToCats < ActiveRecord::Migration[5.2]
  def change
      add_column :dogs, :color, :string
  end
end
