class House < ActiveRecord::Base
    has_many :dogs,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: "Dog"
    # def dogs
    #     Dog.where(house_id: self.id)
    # end
end
