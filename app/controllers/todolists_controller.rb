class TodolistsController < ApplicationController
  def new
  	@book =Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end
  	
  def edit
        @book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
        book.update(book_params)
        redirect_to todolist_path(list.id)
    end

  def create
        # ストロングパラメーターを使用
    book = book.new(book_params)
        # DBへ保存する
    book.save
        # トップ画面へリダイレクト
    redirect_to todolist_path(book.id)
    end

  def index
    @books = Book.all
  end

  def destroy
  	list = Book.find(params[:id]) #データ(レコード)を1件取得
        book.destroy #データ（レコード）を削除
        redirect_to todolists_path #List一覧画面へリダイレク
    end

    private
   
    def book_params
        params.require(:book).permit(:title, :body)
    end

end