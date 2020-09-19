class UsersController < ApplicationController
  before_action :authenticate_user!, except:[:top, :about]

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def top
  end

  def about
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introdution)
  end
end
