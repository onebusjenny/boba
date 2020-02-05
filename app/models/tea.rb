class Tea < ApplicationRecord
    belongs_to :user
    has_many :tea_ingredients
    has_many :ingredients, through: :tea_ingredients
    # validates :ingredients, :length => { :minimum =>  }
    accepts_nested_attributes_for :tea_ingredients, reject_if: proc { |attributes| attributes['amount'].blank? or attributes['ingredient_id'].blank? }
    
    validates :name, presence: true

    scope :ordered, -> { order(name: "desc") }

    def has_ingredients?
        self.ingredients.any?
    end

    # def tea_ingredients_attributes=(tea_ingredient_attributes)
    #     tea_ingredient_attributes.values.each do |tea_ingredient_attribute|
    #       tea_ingredient = TeaIngredient.find_or_create_by(tea_ingredient_attribute)
    #       self.tea_ingredients << tea_ingredients
    #     end
    #   end





    # def tea_ingredients_attributes= (hash_of_hashes)
    #     hash_of_hashes.each do |key,inner_hash|
    #         # binding.pry
    #         if  self.id && self.ingredient_ids.include?(inner_hash[:ingredient_id])
    #             obj = TeaIngredient.find_by( id: inner_hash[:id]) 
    #             obj.update(inner_hash) if inner_hash.values.none?{|s| s.nil? || s.strip.empty? }
    #         else
    #           self.tea_ingredients << TeaIngredient.create(inner_hash)  if inner_hash.values.none?{|s| s.nil? || s.strip.empty? }
    #         end
    #     end
    # end

end
