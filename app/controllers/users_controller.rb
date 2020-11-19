class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user), notice: "Welcome to the theme park!"
        else
            render :new
        end
    end

    def edit
    end

    def show
    end

    def update
        if @user.update(user_params)
            redirect_to @user, notice: 'User was successfully updated.'
        else
            render :edit
        end
    end

    private

    def user_params 
        params.require(:user).permit(:name, :password, :height, :tickets, :happiness, :nausea, :admin)
    end
   
    def set_user
        @user = User.find(params[:id])
    end
end
