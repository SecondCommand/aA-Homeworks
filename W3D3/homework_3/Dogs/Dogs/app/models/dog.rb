class Dog < ActiveRecord::Base
    validates :name, presence: true
    validates :color, presence: true
    validates :no_green_dogs
    def no_green_dogs
        if self.color == "green"
            self.errors[:color] << "can't be green"
        end
    end

    def self.how_long_to_find_bob_dog
        start = Time.now
        Cat.where(name: 'Bob').to_a
        (Time.now - start) * 1000
    end

    belongs_to :house, {
        primary_key: :id,
        foreign_key: :house_id,
        class_name: "House"
    }
end
