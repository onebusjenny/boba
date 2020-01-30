class SessionsController < ApplicationController

    def login


        if logged_in?
            redirect_to teas_path(current_user)
        else
            @user = User.new
            render :login 
        end
    end


    

    def create
        
        user = User.find_by(email:params[:email])
        if user && user.authenticate(password:params[:password])
            session[:user_id] = user.user_id
            redirect_to teas_path(current_user)
        else
            @error = 'invalid credentials'
            render :login
        end
    end

    # def create
    #     @user = User.find_by(username: params[:username])
    #     return head(:forbidden) unless @user.authenticate(params[:password])
    #     session[:user_id] = @user.id
    #   end
    # end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end
    

