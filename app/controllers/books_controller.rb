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
      @book = Book.new(book_params)
      if @book.save
        # book変数に格納したデータの、idカラムを使用するためbook.idを指定する。
        redirect_to book_path(@book.id)
        flash[:create] = "Book was successfully created."
      else
        # 再表示する際の変数を準備
        @books = Book.all
        render :index
      end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
     @book = Book.find(params[:id])
     if @book.update(book_params)
        redirect_to book_path(@book.id)
        flash[:update] = "Book was successfully updated."
      else
        render action: :edit
      end
  end

  def destroy
    book =Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
    # params.permit(:title,:body)
  end

end
