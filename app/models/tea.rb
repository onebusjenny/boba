class Tea < ApplicationRecord
    belongs_to :user
    has_many :tea_ingredients
    has_many :ingredients, through: :tea_ingredients
   
    accepts_nested_attributes_for :tea_ingredients, reject_if: proc { |attributes| attributes['amount'].blank? or attributes['ingredient_id'].blank? }
    
    validates :name, presence: true

    scope :ordered, -> { order(name: "desc") }


end
