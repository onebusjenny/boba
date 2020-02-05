class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:create, :new]

    def index
       
    end

    def signup
       @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
        session[:user_id] = @user.id
        redirect_to teas_path(@tea)
        else
        render :new
        end
    end
     

    def show
      @user = User.find(params[:id])
    end

    def most_teas
      @user = User.most_teas
      render 'show' 
    end 
    
      private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
    
    

end
