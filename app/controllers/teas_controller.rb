class TeasController < ApplicationController
    def all_bobas
        @teas = Tea.ordered
    end

    def index
        @teas = current_user.teas
    end

    def new
        @tea = Tea.new
        @tea.tea_ingredients.build
        @tea.tea_ingredients.build
        @tea.tea_ingredients.build
        @ingredients = Ingredient.all
    end

    def create
        @tea = Tea.new(tea_params)
        @tea.user = current_user
        
        if  @tea.save
            redirect_to teas_path
        else
            @errors = @tea.errors
            @tea.tea_ingredients.build
            @tea.tea_ingredients.build
            @tea.tea_ingredients.build
            @ingredients = Ingredient.all
            render :new
        end
    end

    def show
        @tea = Tea.find(params[:id])

    end


    def edit
        @tea = Tea.find(params[:id])
        @ingredients = Ingredient.all
    end

    def update
        @tea = Tea.find(params[:id])
        @ingredients = Ingredient.all
        @tea.update(tea_params)
        redirect_to teas_path(@tea)
    end

    private

    def tea_params
      params.require(:tea).permit(:name, :flavor, tea_ingredients_attributes: [:id, :ingredient_id, :amount])
    end


end

    
