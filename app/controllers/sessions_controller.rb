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
        if auth_hash = request.env["omiauth.auth"]
            user = User.find_or_create_by_omniauth(auth_hash)
            # raise auth_hash.inspect
        else
                user = User.find_by(email:params[:email])
            if  user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to teas_path(current_user)
            else
                @error = 'invalid credentials'
                render :login
            end
        end
    end


    def destroy
        session.delete :user_id
        redirect_to '/'
    end

    private
 
    def auth
        request.env['omniauth.auth']
    end
end
    

#install the gem
#copy the key from fb dev
#write method in controller, model