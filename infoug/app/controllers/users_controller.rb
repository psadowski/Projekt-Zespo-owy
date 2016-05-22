class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    before_action :owned_profile, only: [:edit, :update]
    
    def index
        @users = User.all
    end
    
    def new
        #@user = User.new
    end
    
    
    def show
        @user = User.where(:user_id => current_user.id)
    end

    def edit
    end

    def update
        if @user.update(profile_params)
            flash[:success] = 'Your profile has been updated.'
            redirect_to profile_path(@user.name)
         else
             @user.errors.full_messages
            flash[:error] = @user.errors.full_messages
            render :edit
         end
    end

    private

    def profile_params
        params.require(:user)
    end

    def owned_profile
        unless current_user == @user
            flash[:alert] = "That profile doesn't belong to you!"
            redirect_to root_path
        end
    end

    def set_user
        @user = User.find_by(name: params[:name])
    end
end