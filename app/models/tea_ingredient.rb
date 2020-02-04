class TeaIngredient < ApplicationRecord
  belongs_to :tea
  belongs_to :ingredient
  validates :amount, presence: true
  
end
