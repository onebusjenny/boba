class TeasController < ApplicationController

    def index
        @teas = Tea.all
    end

    def new
        @tea = Tea.new
        @tea.tea_ingredients.build
        @tea.tea_ingredients.build
        @tea.tea_ingredients.build
        @tea.tea_ingredients.build
        @tea.tea_ingredients.build
        @ingredients = Ingredient.all
    end

    def create
        @tea = Tea.create(
            :name => params[:tea][:name],
            :flavor => params[:tea][:flavor]
        )    
        @tea.ingredient_ids = params[:tea][:ingredient_ids]
        @tea.user = current_user
        if @tea.has_ingredients?&& @tea.save
            redirect_to teas_path(@tea)
        else
            render :new
        end
    end

    def show
        @tea = Tea.find(params[:id])

    end


    def edit
        @tea = Tea.find(params[:id])
    end

    def update
        @tea = Tea.find(params[:id])
        @ingredients = Ingredient.all
        redirect_to teas_path(@tea)
    end


end

    
