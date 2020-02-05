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
        # binding.pry
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to teas_path(current_user)
            # not logging in my user_id for some reason
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
    

#install the gem
#copy the key from fb dev
#write method in controller, model