class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:success] = "successfully"
      redirect_to @book
    else
      flash[:danger] = @book.errors.full_messages
      @books = Book.all
      render 'index'
    end
  end

  def edit
   @book = Book.find(params[:id])
   if current_user.id != @book.user_id
      redirect_to books_path
   end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:success] = "successfully"
      redirect_to book_path(@book.id)
    else
      flash[:danger] = @book.errors.full_messages
      render 'edit'
    end
  end

  def about
  end

  def index
     @books = Book.all
     @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
