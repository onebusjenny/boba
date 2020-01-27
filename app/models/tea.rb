class Tea < ApplicationRecord
    belongs_to :user
    has_many :tea_ingredients
    has_many :ingredients, through: :tea_ingredients
    accepts_nested_attributes_for :tea_ingredients
end
