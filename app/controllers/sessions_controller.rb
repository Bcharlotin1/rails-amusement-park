class SessionsController < ApplicationController

    
    def new
    end 

    def create

        @user = User.find_by(name: params[:name])
        if !@user.blank?
          return head(:forbidden) unless @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render :new
        end 
    end

      def destroy
        session.delete :name
        redirect_to root_path
        
      end

    
end