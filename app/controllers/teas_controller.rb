class TeasController < ApplicationController

    def index
        @teas = Tea.all
    end

    def new
        @tea = Tea.new
        @tea.tea_ingredients.build
        @tea.tea_ingredients.build
        @tea.tea_ingredients.build
       
        @ingredients = Ingredient.all
    end

    def create
        @tea = Tea.new(
            :name => params[:tea][:name],
            :flavor => params[:tea][:flavor]
        )    
        redierect_to tea_path(@tea)     
    end

    def edit
    end

    def update
    end


end

    
