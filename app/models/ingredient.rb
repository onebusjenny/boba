class Ingredient < ApplicationRecord
    has_many :tea_ingredients 
    has_many :teas, through: :tea_ingredients
    
end
