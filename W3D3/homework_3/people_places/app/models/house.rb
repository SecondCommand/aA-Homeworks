class House < ActiveRecord::Base
    has_many: :cats,
        primary_key: :id,
        foreign_key: :house_id,
        class_name: 'People'
end
