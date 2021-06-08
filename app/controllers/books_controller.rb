class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end


  def create
    book= Book.new(book_params)
    book.save
    # book変数に格納したデータの、idカラムを使用するためbook.idを指定する。
    redirect_to book_path(book.id)
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)

  end

end
