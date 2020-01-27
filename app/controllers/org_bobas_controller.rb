class Org_BobasController < ApplicationController

    def index
        @bobas = Boba.all
    end

    def new
        @ingredients = Ingredient.all
    end

    def create 
        @bobas = Boba.new(
        :name => params[:boba][:name]
        :flavor => params[:boba][:flavor])    
        )
    end

    def edit

    end

    def update

    end
    
end
