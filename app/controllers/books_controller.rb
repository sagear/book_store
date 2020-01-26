class BooksController < ApplicationController
  before_action :check_admin, only: [:new, :create]

  def index
    if params[:search].present?
      @books = Book.where("author_name =? or book_name =? or description =?", params[:search], params[:search], params[:search])
    else
      @books = Book.all
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render "new"
    end
  end
end

private

def book_params
  params.require(:book).permit(:author_name, :book_name, :description)
end

def check_admin
  unless current_user.admin?
    redirect_to root_path
  end
end
