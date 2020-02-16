# frozen_string_literal: true

# User controller
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Welcome to the Alpha-Blog'
      redirect_to articles_path
    else
      render 'new'
    end
	end

	def show
		
	end
	
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "#{@user.username}, your account has been updated"
			redirect_to articles_path
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
	end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
