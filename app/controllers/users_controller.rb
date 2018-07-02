class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  #before_action :authenticate_user!, only: [ :edit]


  def index
      @users = User.all.order("created_at DESC").paginate(page: params[:page], per_page:4)
  end

  def edit

  end


  def update

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end

  end
  def show
    @user  = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name, :avatar, :user_about, :gender_id)
  end

  def find_user
    @user = User.find(params[:id])

  end
end
